import { RedisService } from "@liaoliaots/nestjs-redis";
import { Module } from "@nestjs/common";
import { APP_GUARD } from "@nestjs/core";
import { ThrottlerModule as DefaultThrottlerModule } from "@nestjs/throttler";
import { ThrottlerStorageRedisService } from "nestjs-throttler-storage-redis";
import { ThrottlerConfigModule } from "../../../config/security/throttler/throttler.module";
import { ThrottlerConfigService } from "../../../config/security/throttler/throttler.service";
import { GqlThrottlerGuard } from "./throttler.guard";

@Module({
  imports: [
    DefaultThrottlerModule.forRootAsync({
      imports: [ThrottlerConfigModule],
      inject: [RedisService, ThrottlerConfigService],
      useFactory(redisService: RedisService, throttlerConfigService: ThrottlerConfigService) {
        const redis = redisService.getClient();
        return {
          ttl: throttlerConfigService.ttl,
          limit: throttlerConfigService.limit,
          storage: new ThrottlerStorageRedisService(redis),
        };
      },
    }),
  ],
  providers: [
    {
      provide: APP_GUARD,
      useClass: GqlThrottlerGuard,
    },
  ],
})
export class ThrottlerModule {}
