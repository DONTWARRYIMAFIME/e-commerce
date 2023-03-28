import { registerEnumType } from "@nestjs/graphql";

export enum Roles {
  customer = "customer",
  partner = "partner",
  customer_support = "customer_support",
  admin = "admin",
}

registerEnumType(Roles, {
  name: "Roles",
});
