import { registerEnumType } from "@nestjs/graphql";

export enum Sizes {
  Xxs = "XXS",
  Xs = "XS",
  S = "S",
  M = "M",
  L = "L",
  Xl = "XL",
  Xxl = "XXL",
  Xxxl = "XXXL",
}

registerEnumType(Sizes, {
  name: "Sizes",
});
