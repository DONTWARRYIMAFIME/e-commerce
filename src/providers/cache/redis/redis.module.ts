import { RedisModule as DefaultRedisModule } from "@liaoliaots/nestjs-redis";
import { Module } from "@nestjs/common";
import { RedisConfigModule } from "../../../config/cache/redis/redis.module";
import { RedisConfigService } from "../../../config/cache/redis/redis.service";
import { RedisResolver } from "./redis.resolver";

@Module({
  imports: [
    RedisConfigModule,
    DefaultRedisModule.forRootAsync({
      imports: [RedisConfigModule],
      inject: [RedisConfigService],
      useFactory: async (redisConfigService: RedisConfigService) => {
        return {
          readyLog: true,
          config: {
            host: redisConfigService.host,
            port: redisConfigService.port,
            password: redisConfigService.password,
          },
        };
      },
    }),
  ],
  providers: [RedisResolver],
})
export class RedisModule {}
