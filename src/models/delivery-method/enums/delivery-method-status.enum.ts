import { registerEnumType } from "@nestjs/graphql";

export enum DeliveryMethodStatus {
  ACTIVE = "active",
  INACTIVE = "inactive",
}

registerEnumType(DeliveryMethodStatus, {
  name: "DeliveryMethodStatus",
});
