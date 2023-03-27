import { EventEmitter2 } from "@nestjs/event-emitter";
import { hash } from "argon2";
import { DataSource, EntitySubscriberInterface, EventSubscriber, InsertEvent, UpdateEvent } from "typeorm";
import { SecurityConfigService } from "../../../config/security/security.service";
import { UserEntity } from "../entities/user.entity";
import { UserCreatedEvent } from "../events/user-created.event";
import { UserEvents } from "../events/user.events";

@EventSubscriber()
export class UserSubscriber implements EntitySubscriberInterface<UserEntity> {
  constructor(private readonly dataSource: DataSource, private readonly config: SecurityConfigService, private readonly eventEmitter: EventEmitter2) {
    dataSource.subscribers.push(this);
  }

  public listenTo() {
    return UserEntity;
  }

  public async afterLoad(entity: UserEntity) {
    entity.tempPassword = entity.password;
  }

  public afterInsert(event: InsertEvent<UserEntity>) {
    this.eventEmitter.emit(UserEvents.USER_CREATED, new UserCreatedEvent(event.entity));
  }

  public async beforeInsert(event: InsertEvent<UserEntity>) {
    await this.hashPassword(event.entity);
  }

  public async beforeUpdate(event: UpdateEvent<UserEntity>) {
    await this.hashPassword(event.entity as UserEntity);
  }

  private async hashPassword(user: UserEntity) {
    if (user.password !== user.tempPassword) {
      const saltLength = this.config.saltLength;
      user.password = await hash(user.password, { saltLength });
      user.tempPassword = user.password;
    }
  }
}
