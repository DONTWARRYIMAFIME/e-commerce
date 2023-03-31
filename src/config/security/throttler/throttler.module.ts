import { Module } from "@nestjs/common";
import { ThrottlerConfigService } from "./throttler.service";

@Module({
  providers: [ThrottlerConfigService],
  exports: [ThrottlerConfigService],
})
export class ThrottlerConfigModule {}
