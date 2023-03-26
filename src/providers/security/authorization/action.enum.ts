enum CrudActions {
  READ = "read",
  CREATE = "create",
  UPDATE = "update",
  DELETE = "delete",
  AGGREGATE = "aggregate",
  MANAGE = "manage",
}

export type Actions = CrudActions;
export const Actions = CrudActions;
