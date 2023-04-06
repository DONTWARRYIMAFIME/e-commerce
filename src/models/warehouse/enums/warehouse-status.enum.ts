import { registerEnumType } from "@nestjs/graphql";

export enum WarehouseStatus {
  ACTIVE = "active",
  INACTIVE = "inactive",
}

registerEnumType(WarehouseStatus, {
  name: "WarehouseStatus",
});
