import { Injectable } from "@nestjs/common";
import { hash } from "argon2";
import { EntityManager, EntitySubscriberInterface, EventSubscriber, InsertEvent, UpdateEvent } from "typeorm";
import { SecurityConfigService } from "../../../config/security/security.service";
import { User } from "../entities/user.entity";

@EventSubscriber()
@Injectable()
export class UserSubscriber implements EntitySubscriberInterface<User> {
  constructor(private readonly entityManager: EntityManager, private readonly config: SecurityConfigService) {
    entityManager.connection.subscribers.push(this);
  }

  public listenTo() {
    return User;
  }

  public afterLoad(entity: User) {
    entity.tempPassword = entity.password;
  }

  public async beforeInsert(event: InsertEvent<User>) {
    await this.hashPassword(event.entity);
  }

  public async beforeUpdate(event: UpdateEvent<User>) {
    await this.hashPassword(event.entity as User);
  }

  private async hashPassword(user: User) {
    if (user.password !== user.tempPassword) {
      const saltLength = this.config.saltLength;
      user.password = await hash(user.password, { saltLength });
      user.tempPassword = user.password;
    }
  }
}
