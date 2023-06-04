import { Injectable } from "@nestjs/common";
import { OnEvent } from "@nestjs/event-emitter";
import { Actions } from "../../../providers/security/casl/actions.enum";
import { PaymentIntentEntity } from "../../payment-intent/entities/payment-intent.entity";
import { PaymentIntentStatus } from "../../payment-intent/enum/payment-intent-status.enum";
import { PaymentIntentUpdateEvent } from "../../payment-intent/events/payment-intent-update.event";
import { OrderService } from "../order.service";

@Injectable()
export class PaymentIntentUpdateListener {
  constructor(private readonly orderService: OrderService) {}

  @OnEvent(JSON.stringify({ subject: PaymentIntentEntity.name, action: Actions.UPDATE }))
  public async handleUserCreatedEvent({ paymentIntent }: PaymentIntentUpdateEvent) {
    if (paymentIntent.status === PaymentIntentStatus.SUCCEEDED) {
      await this.orderService.confirmPayment(paymentIntent.id);
    }
  }
}
