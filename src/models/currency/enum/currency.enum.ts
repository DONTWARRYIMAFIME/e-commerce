import { registerEnumType } from "@nestjs/graphql";

export enum Currency {
  USD = "usd",
  BYN = "byn",
}

registerEnumType(Currency, {
  name: "Currency",
});
