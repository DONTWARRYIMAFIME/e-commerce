import { registerEnumType } from "@nestjs/graphql";

export enum Sizes {
  XXS = "xxs",
  XS = "xs",
  S = "s",
  M = "m",
  L = "l",
  XL = "xl",
  XXL = "2xl",
  XXXL = "3xl",
}

registerEnumType(Sizes, {
  name: "Sizes",
});
