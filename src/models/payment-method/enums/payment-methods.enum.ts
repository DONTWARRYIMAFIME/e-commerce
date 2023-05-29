import { registerEnumType } from "@nestjs/graphql";

export enum PaymentMethods {
  CASH = "cash",
  CARD = "card",
}

registerEnumType(PaymentMethods, {
  name: "PaymentMethods",
});
