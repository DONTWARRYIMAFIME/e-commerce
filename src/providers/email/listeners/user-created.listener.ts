import { Injectable } from "@nestjs/common";
import { OnEvent } from "@nestjs/event-emitter";
import { UserCreatedEvent } from "../../../models/user/events/user-created.event";
import { UserEvents } from "../../../models/user/events/user.events";
import { EmailService } from "../email.service";
import { REGISTRATION_EMAIL } from "../email.constants";

@Injectable()
export class UserCreatedListener {
  constructor(private readonly emailService: EmailService) {}

  @OnEvent(UserEvents.USER_CREATED)
  public async handleUserCreatedEvent(payload: UserCreatedEvent) {
    const { user } = payload;
    await this.emailService.sendMail({
      to: user.email,
      template: REGISTRATION_EMAIL,
      context: {
        name: `${user.firstName} ${user.lastName}`,
      },
    });
  }
}
