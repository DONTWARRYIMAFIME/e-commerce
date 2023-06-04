import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { STRIPE_API_KEY, STRIPE_API_VERSION, STRIPE_WEBHOOK_SECRET } from "./stripe.constants";

@Injectable()
export class StripeConfigService {
  constructor(private configService: ConfigService) {}

  get apiKey(): string {
    return this.configService.getOrThrow<string>(STRIPE_API_KEY);
  }

  get apiVersion(): string {
    return this.configService.getOrThrow<string>(STRIPE_API_VERSION);
  }

  get webhookSecret(): string {
    return this.configService.getOrThrow<string>(STRIPE_WEBHOOK_SECRET);
  }
}
