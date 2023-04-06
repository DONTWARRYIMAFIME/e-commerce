import { registerEnumType } from "@nestjs/graphql";

export enum Currencies {
  BYN = "byn",
  USD = "usd",
}

registerEnumType(Currencies, {
  name: "Currencies",
});
