import { registerEnumType } from "@nestjs/graphql";

export enum DeliveryMethods {
  STANDARD_PICKUP = "standard_pickup",
  STANDARD_HOME = "standard_home",
  YANDEX = "yandex",
  DHL = "dhl",
}

registerEnumType(DeliveryMethods, {
  name: "DeliveryMethod",
});
