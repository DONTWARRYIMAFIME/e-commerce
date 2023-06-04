import { Module } from "@nestjs/common";
import { StripeModule as DefaultStripe } from "nestjs-stripe";
import { StripeConfigModule } from "../../../config/payment/stripe/stripe.module";
import { StripeConfigService } from "../../../config/payment/stripe/stripe.service";
import { CartModule } from "../../../models/cart/cart.module";
import { PaymentIntentModule } from "../../../models/payment-intent/payment-intent.module";
import { StripeController } from "./stripe.controller";

@Module({
  imports: [
    CartModule,
    PaymentIntentModule,
    StripeConfigModule,
    DefaultStripe.forRootAsync({
      imports: [StripeConfigModule],
      inject: [StripeConfigService],
      useFactory: (stripeConfigService: StripeConfigService) => ({
        apiKey: stripeConfigService.apiKey,
        apiVersion: stripeConfigService.apiVersion as any,
      }),
    }),
  ],
  controllers: [StripeController],
})
export class StripeModule {}
