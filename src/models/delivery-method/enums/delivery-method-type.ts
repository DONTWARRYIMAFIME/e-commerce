import { registerEnumType } from "@nestjs/graphql";

export enum DeliveryMethodTypes {
  HOME_DELIVERY = "home_delivery",
  PICKUP_POINT_DELIVERY = "pickup_point_delivery",
}

registerEnumType(DeliveryMethodTypes, {
  name: "DeliveryMethodType",
});
