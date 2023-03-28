import { UserEntity } from "../entities/user.entity";

export class UserCreateEvent {
  constructor(public readonly user: UserEntity) {}
}
