import { BullModule as DefaultBullModule } from "@nestjs/bull";
import { Module } from "@nestjs/common";
import { RedisConfigModule } from "../../../config/cache/redis/redis.module";
import { RedisConfigService } from "../../../config/cache/redis/redis.service";

@Module({
  imports: [
    DefaultBullModule.forRootAsync({
      imports: [RedisConfigModule],
      inject: [RedisConfigService],
      useFactory: (redisConfigService: RedisConfigService) => ({
        redis: {
          host: redisConfigService.host,
          port: redisConfigService.port,
          password: redisConfigService.password,
        },
      }),
    }),
  ],
})
export class BullModule {}
