import { registerEnumType } from "@nestjs/graphql";

export enum OrderStatus {
  CREATED = "created",
  RESERVED_IN_WAREHOUSE = "reserved_in_warehouse",
  WAITING_FOR_PAYMENT = "waiting_for_payment",
  PAID = "PAID",
  READY_FOR_SHIPPING = "ready_for_shipping",
  IN_SHIPPING = "in_shipping",
  ON_THE_WAY_TO_WAREHOUSE = "on_the_way_to_warehouse",
  CANCELLED = "cancelled",
  REJECTED = "rejected",
  COMPLETED = "complete",
}

registerEnumType(OrderStatus, {
  name: "OrderStatus",
});
