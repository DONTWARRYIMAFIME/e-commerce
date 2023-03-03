import { Module } from "@nestjs/common";
import { SecurityConfigService } from "./security.service";

@Module({
  providers: [SecurityConfigService],
  exports: [SecurityConfigService],
})
export class SecurityConfigModule {}
