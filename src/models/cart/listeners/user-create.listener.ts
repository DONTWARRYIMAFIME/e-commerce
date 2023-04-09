import { Injectable } from "@nestjs/common";
import { OnEvent } from "@nestjs/event-emitter";
import { Actions } from "../../../providers/security/casl/actions.enum";
import { UserEntity } from "../../user/entities/user.entity";
import { UserCreateEvent } from "../../user/events/user-create.event";
import { CartService } from "../cart.service";

@Injectable()
export class UserCreatedListener {
  constructor(private readonly cartService: CartService) {}

  @OnEvent(JSON.stringify({ subject: UserEntity.name, action: Actions.CREATE }))
  public async handleUserCreatedEvent(payload: UserCreateEvent) {
    await this.cartService.createOne({ user: payload.user });
  }
}
