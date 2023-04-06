import { registerEnumType } from "@nestjs/graphql";

enum CrudActions {
  READ = "READ",
  CREATE = "CREATE",
  UPDATE = "UPDATE",
  DELETE = "DELETE",
  AGGREGATE = "AGGREGATE",
  MANAGE = "MANAGE",
}

export type Actions = CrudActions;
export const Actions = CrudActions;

registerEnumType(Actions, {
  name: "Actions",
});
