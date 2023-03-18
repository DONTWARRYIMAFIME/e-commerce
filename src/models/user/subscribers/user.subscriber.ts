import { Injectable } from "@nestjs/common";
import { EventEmitter2 } from "@nestjs/event-emitter";
import { hash } from "argon2";
import { EntityManager, EntitySubscriberInterface, EventSubscriber, InsertEvent, UpdateEvent } from "typeorm";
import { SecurityConfigService } from "../../../config/security/security.service";
import { User } from "../entities/user.entity";
import { UserCreatedEvent } from "../events/user-created.event";
import { UserEvents } from "../events/user.events";

@EventSubscriber()
@Injectable()
export class UserSubscriber implements EntitySubscriberInterface<User> {
  constructor(private readonly entityManager: EntityManager, private readonly config: SecurityConfigService, private readonly eventEmitter: EventEmitter2) {
    entityManager.connection.subscribers.push(this);
  }

  public listenTo() {
    return User;
  }

  public afterLoad(entity: User) {
    entity.tempPassword = entity.password;
    entity.email = entity.emailAddress.email;
  }

  public afterInsert(event: InsertEvent<User>) {
    this.eventEmitter.emit(UserEvents.USER_CREATED, new UserCreatedEvent(event.entity));
  }

  public async beforeInsert(event: InsertEvent<User>) {
    await this.hashPassword(event.entity);
    event.entity.email = event.entity.emailAddress.email;
  }

  public async beforeUpdate(event: UpdateEvent<User>) {
    await this.hashPassword(event.entity as User);
    event.entity.email = event.entity.emailAddress.email;
  }

  private async hashPassword(user: User) {
    if (user.password !== user.tempPassword) {
      const saltLength = this.config.saltLength;
      user.password = await hash(user.password, { saltLength });
      user.tempPassword = user.password;
    }
  }
}
