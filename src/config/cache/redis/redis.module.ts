import { Module } from "@nestjs/common";
import { RedisConfigService } from "./redis.service";

@Module({
  providers: [RedisConfigService],
  exports: [RedisConfigService],
})
export class RedisConfigModule {}
