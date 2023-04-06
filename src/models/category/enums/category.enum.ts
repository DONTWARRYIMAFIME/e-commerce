import { registerEnumType } from "@nestjs/graphql";

export enum Categories {
  ROOT = "root",
  MEN = "men",
  WOMEN = "women",
  HOODIES = "hoodies",
  SHIRTS = "shirts",
  SKIRTS = "skirts",
  BLAZERS = "blazer",
}

registerEnumType(Categories, {
  name: "Categories",
});
