import { Injectable } from "@nestjs/common";

import { UserBeforeFilterHook } from "nest-casl";
import { UserEntity } from "../entities/user.entity";
import { UserService } from "../user.service";

@Injectable()
export class UserHook implements UserBeforeFilterHook<UserEntity> {
  constructor(readonly userService: UserService) {}

  public async run(user: UserEntity): Promise<UserEntity> {
    return this.userService.findOneById(user.id);
  }
}
