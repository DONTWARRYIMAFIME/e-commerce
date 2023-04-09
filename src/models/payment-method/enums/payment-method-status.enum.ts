import { registerEnumType } from "@nestjs/graphql";

export enum PaymentMethodStatus {
  ACTIVE = "active",
  INACTIVE = "inactive",
}

registerEnumType(PaymentMethodStatus, {
  name: "PaymentMethodStatus",
});
