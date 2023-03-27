import { Injectable } from "@nestjs/common";
import { OnEvent } from "@nestjs/event-emitter";
import { UserEntity } from "../../../models/user/entities/user.entity";
import { UserCreateEvent } from "../../../models/user/events/user-create.event";
import { Actions } from "../../security/authorization/action.enum";
import { REGISTRATION_EMAIL } from "../email.constants";
import { EmailService } from "../email.service";

@Injectable()
export class UserCreatedListener {
  constructor(private readonly emailService: EmailService) {}

  @OnEvent(JSON.stringify({ subject: UserEntity.name, action: Actions.CREATE }))
  public async handleUserCreatedEvent(payload: UserCreateEvent) {
    const { user } = payload;
    await this.emailService.sendMail({
      to: user.emailAddress.address,
      template: REGISTRATION_EMAIL,
      context: {
        name: `${user.firstName} ${user.lastName}`,
      },
    });
  }
}
