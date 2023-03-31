import { RedisService } from "@liaoliaots/nestjs-redis";
import { CallHandler, ExecutionContext, Injectable, NestInterceptor } from "@nestjs/common";
import { Reflector } from "@nestjs/core";
import { GqlExecutionContext } from "@nestjs/graphql";
import Redis from "ioredis";
import { Observable, of } from "rxjs";
import { tap } from "rxjs/operators";
import { RedisConfigService } from "../../../config/cache/redis/redis.service";
import { NO_CACHE } from "./noCache.decorator";

@Injectable()
export class RedisInterceptor implements NestInterceptor {
  private readonly redis: Redis;

  constructor(private readonly redisService: RedisService, private readonly redisConfigService: RedisConfigService, private readonly reflector: Reflector) {
    this.redis = redisService.getClient();
  }

  public async intercept(context: ExecutionContext, next: CallHandler): Promise<Observable<any>> {
    if ((context.getType() as any) !== "graphql") {
      return next.handle();
    }

    const noCache = this.reflector.get<boolean>(NO_CACHE, context.getHandler());

    if (noCache) {
      return next.handle();
    }

    const gqlContext = GqlExecutionContext.create(context);
    const { fieldName, returnType, path } = gqlContext.getInfo();

    // Cache only query requests
    if (path.typename !== "Query") {
      return next.handle();
    }

    const cacheKey = this.generateCacheKey(fieldName, returnType, gqlContext.getArgs());
    const cacheValue = await this.redis.get(cacheKey);

    if (cacheValue) {
      return of(JSON.parse(cacheValue));
    }

    return next.handle().pipe(
      tap(async data => {
        await this.redis.set(cacheKey, JSON.stringify(data), "EX", this.redisConfigService.ttl);
        return data;
      }),
    );
  }

  private generateCacheKey(fieldName, returnType, args) {
    const variables = JSON.stringify(args);
    return `${fieldName}:${returnType}:${variables}`;
  }
}
