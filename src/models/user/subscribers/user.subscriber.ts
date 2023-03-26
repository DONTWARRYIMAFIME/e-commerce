import { Injectable } from "@nestjs/common";
import { EventEmitter2 } from "@nestjs/event-emitter";
import { hash } from "argon2";
import { EntityManager, EntitySubscriberInterface, EventSubscriber, InsertEvent, UpdateEvent } from "typeorm";
import { SecurityConfigService } from "../../../config/security/security.service";
import { UserEntity } from "../entities/user.entity";
import { UserCreatedEvent } from "../events/user-created.event";
import { UserEvents } from "../events/user.events";

@EventSubscriber()
@Injectable()
export class UserSubscriber implements EntitySubscriberInterface<UserEntity> {
  constructor(private readonly entityManager: EntityManager, private readonly config: SecurityConfigService, private readonly eventEmitter: EventEmitter2) {
    entityManager.connection.subscribers.push(this);
  }

  public listenTo() {
    return UserEntity;
  }

  public afterLoad(entity: UserEntity) {
    entity.tempPassword = entity.password;
    entity.email = entity.emailAddressEntity.address;
    entity.roles = entity.roleEntities.map(role => role.name);
  }

  public afterInsert(event: InsertEvent<UserEntity>) {
    this.eventEmitter.emit(UserEvents.USER_CREATED, new UserCreatedEvent(event.entity));
    event.entity.email = event.entity.emailAddressEntity.address;
    event.entity.roles = event.entity.roleEntities.map(role => role.name);
  }

  public async afterUpdate(event: UpdateEvent<UserEntity>) {
    event.entity.email = (event.entity as UserEntity).emailAddressEntity.address;
    event.entity.roles = (event.entity as UserEntity).roleEntities.map(role => role.name);
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
