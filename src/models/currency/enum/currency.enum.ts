import { registerEnumType } from "@nestjs/graphql";

export enum Currencies {
  USD = "USD",
  BYN = "BYN",
}

registerEnumType(Currencies, {
  name: "Currencies",
});
