import { BadRequestException, Controller, Post, RawBodyRequest, Req, UseGuards } from "@nestjs/common";
import { Request } from "express";
import { InjectStripe } from "nestjs-stripe";
import Stripe from "stripe";
import { StripeConfigService } from "../../../config/payment/stripe/stripe.service";
import { PaymentIntentStatus } from "../../../models/payment-intent/enum/payment-intent-status.enum";
import { PaymentIntentService } from "../../../models/payment-intent/payment-intent.service";
import { IsPublic } from "../../security/auth/decorators/is-public.decorator";
import { AccessTokenAuthGuard } from "../../security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../security/casl/access.guard";

@Controller("stripe")
export class StripeController {
  constructor(
    @InjectStripe() private readonly stripe: Stripe,
    private readonly stripeConfigService: StripeConfigService,
    private readonly paymentIntentService: PaymentIntentService,
  ) {}

  @IsPublic()
  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @Post("/webhook")
  async webhook(@Req() request: RawBodyRequest<Request>): Promise<void> {
    const webhookSecret = this.stripeConfigService.webhookSecret;
    const signature = request.headers["stripe-signature"];

    let event: Stripe.Event;

    try {
      event = this.stripe.webhooks.constructEvent(request.rawBody, signature, webhookSecret);
    } catch (err) {
      throw new BadRequestException(`Webhook Error: ${err.message}`);
    }

    let intent = null;
    switch (event.type) {
      case "payment_intent.succeeded":
        intent = event.data.object;
        console.log("Succeeded: ", intent.id);
        await this.paymentIntentService.updateStatusByIntentId(intent.id, PaymentIntentStatus.SUCCEEDED);
        break;
    }
  }
}
