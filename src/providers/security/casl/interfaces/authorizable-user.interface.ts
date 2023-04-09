import { AnyObject } from "@casl/ability/dist/types/types";

export interface PermissionCondition {
  [field: string]: string;
}

export interface Permission<Action = string, Subject = AnyObject, Conditions = AnyObject> {
  action: Action;
  subject: Subject;
  conditions: Conditions;
}

export interface AuthorizableUser<Permissions = Permission, Id = string> {
  id: Id;
  permissions?: Permissions[];
}
