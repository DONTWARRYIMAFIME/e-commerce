import { Module } from "@nestjs/common";
import { StripeConfigService } from "./stripe.service";

@Module({
  providers: [StripeConfigService],
  exports: [StripeConfigService],
})
export class StripeConfigModule {}
