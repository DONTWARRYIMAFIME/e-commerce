import { registerEnumType } from "@nestjs/graphql";

export enum Currency {
  USD = "USD",
  BYN = "BYN",
}

registerEnumType(Currency, {
  name: "Currency",
});
