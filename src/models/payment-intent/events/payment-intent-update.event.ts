import { PaymentIntentEntity } from "../entities/payment-intent.entity";

export class PaymentIntentUpdateEvent {
  constructor(public readonly paymentIntent: PaymentIntentEntity) {}
}
