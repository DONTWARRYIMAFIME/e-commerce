import { registerEnumType } from "@nestjs/graphql";

export enum Sizes {
  "2XS" = "2xs",
  XS = "xs",
  S = "s",
  M = "m",
  L = "l",
  XL = "xl",
  "2XL" = "2xl",
  "3XL" = "3xl",
}

registerEnumType(Sizes, {
  name: "Sizes",
});
