import { registerEnumType } from "@nestjs/graphql";

export enum Country {
  BY = "BY",
  RU = "RU",
  UA = "UA",
  PL = "PL",
}

registerEnumType(Country, {
  name: "Country",
});
