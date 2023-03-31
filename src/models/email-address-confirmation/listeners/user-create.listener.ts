import { Injectable } from "@nestjs/common";
import { OnEvent } from "@nestjs/event-emitter";
import { Actions } from "nest-casl";
import { REGISTRATION_EMAIL } from "../../../providers/email/email.constants";
import { UserEntity } from "../../user/entities/user.entity";
import { UserCreateEvent } from "../../user/events/user-create.event";
import { EmailAddressConfirmationService } from "../email-address-confirmation.service";

@Injectable()
export class UserCreatedListener {
  constructor(private readonly service: EmailAddressConfirmationService) {}

  @OnEvent(JSON.stringify({ subject: UserEntity.name, action: Actions.create }))
  public async handleUserCreatedEvent(payload: UserCreateEvent) {
    await this.service.sendConfirmationEmail(payload.user, REGISTRATION_EMAIL);
  }
}
