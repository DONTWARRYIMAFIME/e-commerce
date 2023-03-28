import { registerEnumType } from "@nestjs/graphql";

export enum Roles {
  CUSTOMER = "customer",
  PARTNER = "partner",
  CUSTOMER_SUPPORT = "customer_support",
  ADMIN = "admin",
}

registerEnumType(Roles, {
  name: "Roles",
});
