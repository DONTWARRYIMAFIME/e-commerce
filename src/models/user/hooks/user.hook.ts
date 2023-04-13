import { Injectable } from "@nestjs/common";
import { CachedUser } from "../../../providers/security/auth/types/token-payload.interface";
import { UserBeforeFilterHook } from "../../../providers/security/casl/interfaces/hooks.interface";
import { UserEntity } from "../entities/user.entity";
import { UserService } from "../user.service";

@Injectable()
export class UserHook implements UserBeforeFilterHook<CachedUser> {
  constructor(readonly userService: UserService) {}

  public async run(user: UserEntity) {
    return this.userService.findById(user.id);
  }
}
