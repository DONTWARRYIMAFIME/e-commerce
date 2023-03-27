import { Injectable } from "@nestjs/common";
import { UserBeforeFilterHook } from "nest-casl";
import { CachedUser } from "../../../providers/security/authorization/types/request-user.interface";
import { UserService } from "../user.service";

@Injectable()
export class UserHook implements UserBeforeFilterHook {
  constructor(private readonly userService: UserService) {}

  async run(user: CachedUser) {
    console.log("user", user);
    return {
      ...user,
      ...(await this.userService.findOneById(user.id)),
    };
  }
}
