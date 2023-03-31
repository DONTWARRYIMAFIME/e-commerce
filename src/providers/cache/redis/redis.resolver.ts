import { RedisService } from "@liaoliaots/nestjs-redis";
import { Query, Resolver } from "@nestjs/graphql";
import Redis from "ioredis";
import { RedisConfigService } from "../../../config/cache/redis/redis.service";
import { IsPublic } from "../../security/authentication/decorators/isPublic.decorator";

@Resolver()
export class RedisResolver {
  private readonly redis: Redis;

  constructor(private readonly redisConfigService: RedisConfigService, private readonly redisService: RedisService) {
    this.redis = this.redisService.getClient();
  }

  @IsPublic()
  @Query(() => Boolean)
  public async healthCheckRedis(): Promise<boolean> {
    return !!this.redisService.getClient();
  }
}
