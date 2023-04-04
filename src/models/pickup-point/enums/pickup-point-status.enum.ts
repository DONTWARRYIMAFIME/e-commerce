import { registerEnumType } from "@nestjs/graphql";

export enum PickupPointStatus {
  ACTIVE = "active",
  INACTIVE = "inactive",
}

registerEnumType(PickupPointStatus, {
  name: "PickupPointStatus",
});
