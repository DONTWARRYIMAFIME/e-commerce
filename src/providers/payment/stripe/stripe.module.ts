import { Module } from "@nestjs/common";
import { StripeModule as DefaultStripe } from "nestjs-stripe";
import { StripeConfigModule } from "../../../config/payment/stripe/stripe.module";
import { StripeConfigService } from "../../../config/payment/stripe/stripe.service";
import { CartModule } from "../../../models/cart/cart.module";
import { StripeResolver } from "./stripe.resolver";
import { StripeService } from "./stripe.service";

@Module({
  imports: [
    CartModule,
    DefaultStripe.forRootAsync({
      imports: [StripeConfigModule],
      inject: [StripeConfigService],
      useFactory: (stripeConfigService: StripeConfigService) => ({
        apiKey: stripeConfigService.apiKey,
        apiVersion: stripeConfigService.apiVersion as any,
      }),
    }),
  ],
  providers: [StripeResolver, StripeService],
})
export class StripeModule {}
