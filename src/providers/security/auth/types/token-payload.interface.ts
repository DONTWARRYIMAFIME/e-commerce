import { Id } from "../../../../common/types/id.type";
import { PermissionEntity } from "../../../../models/permission/entities/permission.entity";
import { AuthorizableUser } from "../../casl/interfaces/authorizable-user.interface";

export type CachedUser = AuthorizableUser<PermissionEntity, Id>;

export interface TokenPayload extends CachedUser {
  iat?: number;
  exp?: number;
}
