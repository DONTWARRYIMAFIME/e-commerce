import { registerEnumType } from "@nestjs/graphql";

export enum WarehouseStatus {
  ACTIVE = "ACTIVE",
  INACTIVE = "INACTIVE",
}

registerEnumType(WarehouseStatus, {
  name: "WarehouseStatus",
});
