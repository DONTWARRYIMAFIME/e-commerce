import { FilterableField, FilterableRelation } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { AfterLoad, Column, JoinColumn, OneToOne } from "typeorm";
import { Entity } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { UserEntity } from "../../user/entities/user.entity";

@FilterableRelation("user", () => UserEntity)
@ObjectType("emailAddressConfirmation")
@Entity()
export class EmailAddressConfirmationEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  userId!: number;

  @OneToOne(() => UserEntity, { onUpdate: "CASCADE", onDelete: "CASCADE" })
  @JoinColumn()
  user!: UserEntity;

  @FilterableField()
  @Column()
  email!: string;

  @FilterableField()
  @Column()
  token!: string;

  @FilterableField()
  @Column()
  expiresAt!: Date;

  @FilterableField()
  expired!: boolean;

  @AfterLoad()
  isExpired() {
    this.expired = this.createdAt.getTime() < this.expiresAt.getTime();
  }
}
