import { registerEnumType } from "@nestjs/graphql";

export enum PaymentIntentStatus {
  CANCELED = "canceled",
  PROCESSING = "processing",
  REQUIRES_ACTION = "requires_action",
  REQUIRES_CAPTURE = "requires_capture",
  REQUIRES_CONFIRMATION = "requires_confirmation",
  REQUIRES_PAYMENT_METHOD = "requires_payment_method",
  SUCCEEDED = "succeeded",
  REFUNDED = "refunded",
}

registerEnumType(PaymentIntentStatus, {
  name: "PaymentIntentStatus",
});
