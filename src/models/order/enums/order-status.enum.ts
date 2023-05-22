import { registerEnumType } from "@nestjs/graphql";

export enum OrderStatus {
  CREATED = "created",
  WAITING_FOR_PAYMENT = "waiting_for_payment",
  PAID = "PAID",
  IN_SHIPPING = "in_shipping",
  ON_THE_WAY_TO_WAREHOUSE = "on_the_way_to_warehouse",
  CANCELLED = "cancelled",
  REJECTED = "rejected",
  COMPLETED = "complete",
}

registerEnumType(OrderStatus, {
  name: "OrderStatus",
});
