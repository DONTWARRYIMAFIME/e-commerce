import { Injectable } from "@nestjs/common";
import { OnEvent } from "@nestjs/event-emitter";
import { UserCreatedEvent } from "../../user/events/user-created.event";
import { UserEvents } from "../../user/events/user.events";
import { EmailAddressConfirmationService } from "../email-address-confirmation.service";

@Injectable()
export class UserCreatedListener {
  constructor(private readonly emailAddressConfirmationService: EmailAddressConfirmationService) {}

  @OnEvent(UserEvents.USER_CREATED)
  public async handleUserCreatedEvent(payload: UserCreatedEvent) {
    const { user } = payload;
    await this.emailAddressConfirmationService.sendConfirmationEmail(user);
  }
}
