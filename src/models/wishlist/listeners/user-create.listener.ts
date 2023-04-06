import { Injectable } from "@nestjs/common";
import { OnEvent } from "@nestjs/event-emitter";
import { Actions } from "../../../providers/security/authorization/enums/actions.enum";
import { UserEntity } from "../../user/entities/user.entity";
import { UserCreateEvent } from "../../user/events/user-create.event";
import { WishlistService } from "../wishlist.service";

@Injectable()
export class UserCreatedListener {
  constructor(private readonly wishlistService: WishlistService) {}

  @OnEvent(JSON.stringify({ subject: UserEntity.name, action: Actions.CREATE }))
  public async handleUserCreatedEvent(payload: UserCreateEvent) {
    await this.wishlistService.createOne({ user: payload.user });
  }
}
