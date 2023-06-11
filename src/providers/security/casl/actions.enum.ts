import { registerEnumType } from "@nestjs/graphql";

export enum DefaultActions {
  READ = "read",
  AGGREGATE = "aggregate",
  CREATE = "create",
  UPDATE = "update",
  DELETE = "delete",
  MANAGE = "manage",
}

export enum OrderActions {
  CANCEL = "cancel",
  REJECT = "reject",
  TRANSFER_TO_DELIVERY = "transfer_to_delivery",
  COMPLETE = "complete",
}

export type Actions = DefaultActions | OrderActions;
export const Actions = { ...DefaultActions, ...OrderActions };

registerEnumType(Actions, {
  name: "Actions",
});
