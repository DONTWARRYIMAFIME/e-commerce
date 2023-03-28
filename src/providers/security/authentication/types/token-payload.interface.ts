import { CachedUser } from "../../authorization/types/request-user.interface";

export interface TokenPayload extends CachedUser {
  iat?: number;
  exp?: number;
}
