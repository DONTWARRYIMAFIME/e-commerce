import { registerEnumType } from "@nestjs/graphql";

export enum Roles {
  CUSTOMER = "CUSTOMER",
  PARTNER = "PARTNER",
  CUSTOMER_SUPPORT = "CUSTOMER_SUPPORT",
  ADMIN = "ADMIN",
}

registerEnumType(Roles, {
  name: "Roles",
});
