import { registerEnumType } from "@nestjs/graphql";

export enum DeliveryMethod {
  PICKUP = "pickup",
  STANDARD = "standard",
  YANDEX = "yandex",
  DHL = "dhl",
}

registerEnumType(DeliveryMethod, {
  name: "DeliveryMethod",
});
