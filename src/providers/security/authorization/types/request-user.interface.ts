import { AuthorizableUser } from "nest-casl";
import { Id } from "../../../../common/types/id.type";
import { Roles } from "../role/role.enum";

export type CachedUser = AuthorizableUser<Roles, Id>;
