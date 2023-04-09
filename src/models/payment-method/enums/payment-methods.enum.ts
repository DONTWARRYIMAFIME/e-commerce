import { registerEnumType } from "@nestjs/graphql";

export enum PaymentMethods {
  CASH_ON_DELIVERY = "cash_on_delivery",
  CARD = "card",
}

registerEnumType(PaymentMethods, {
  name: "PaymentMethods",
});
