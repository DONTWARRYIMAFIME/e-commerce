import { registerEnumType } from "@nestjs/graphql";

export enum Categories {
  ROOT = "root",
  MEN = "men",
  WOMEN = "women",
  HOODIES = "hoodies",
  SHIRTS = "shirts",
  SKIRTS = "skirts",
  BLAZERS = "blazer",
  DRESSES = "dresses",
  SHORTS = "shorts",
  SLEEPWEAR = "sleepwear",
  COATS = "coats",
  TOPS = "tops",
  SWIMWEAR = "swimwear",
  JEANS = "jeans",
  PANTS = "pants",
  T_SHIRT = "t_shirt",
}

registerEnumType(Categories, {
  name: "Categories",
});
