import { registerEnumType } from "@nestjs/graphql";

export enum DefaultActions {
  READ = "read",
  AGGREGATE = "aggregate",
  CREATE = "create",
  UPDATE = "update",
  DELETE = "delete",
  MANAGE = "manage",
}

export type Actions = DefaultActions;
export const Actions = DefaultActions;

registerEnumType(Actions, {
  name: "Actions",
});
