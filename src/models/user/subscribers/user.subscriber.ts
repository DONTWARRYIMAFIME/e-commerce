import { EventEmitter2 } from "@nestjs/event-emitter";
import { hash } from "argon2";
import { DataSource, EntitySubscriberInterface, EventSubscriber, InsertEvent, UpdateEvent } from "typeorm";
import { SecurityConfigService } from "../../../config/security/security.service";
import { Actions } from "../../../providers/security/authorization/action.enum";
import { UserEntity } from "../entities/user.entity";
import { UserCreateEvent } from "../events/user-create.event";

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
    this.concatName(entity);
  }

  public afterInsert(event: InsertEvent<UserEntity>) {
    this.eventEmitter.emit(JSON.stringify({ subject: UserEntity.name, action: Actions.CREATE }), new UserCreateEvent(event.entity));
  }

  public async beforeInsert(event: InsertEvent<UserEntity>) {
    await this.hashPassword(event.entity);
    this.concatName(event.entity);
  }

  public async beforeUpdate(event: UpdateEvent<UserEntity>) {
    await this.hashPassword(event.entity as UserEntity);
    this.concatName(event.entity as UserEntity);
  }

  private async hashPassword(user: UserEntity) {
    if (user.password !== user.tempPassword) {
      const saltLength = this.config.saltLength;
      user.password = await hash(user.password, { saltLength });
      user.tempPassword = user.password;
    }
  }

  private concatName(entity: UserEntity) {
    entity.fullName = `${entity.firstName} ${entity.lastName}`;
  }
}
