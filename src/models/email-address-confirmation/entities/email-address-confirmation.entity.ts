import { FilterableField, FilterableRelation } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { BeforeInsert, BeforeUpdate, Column, JoinColumn, ManyToOne, OneToOne, Unique } from "typeorm";
import { Entity } from "../../../common/decorators";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { EmailAddressEntity } from "../../email-address/entities/email-address.entity";
import { UserEntity } from "../../user/entities/user.entity";

@FilterableRelation("user", () => UserEntity)
@FilterableRelation("emailAddress", () => EmailAddressEntity)
@ObjectType("emailAddressConfirmation")
@Unique("UNQ_email_address_confirmation_token", ["token"])
@Entity()
export class EmailAddressConfirmationEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  userId: Id;

  @OneToOne(() => UserEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  user!: UserEntity;

  @FilterableField(() => ID)
  @Column()
  emailAddressId: Id;

  @ManyToOne(() => EmailAddressEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  emailAddress!: EmailAddressEntity;

  @FilterableField()
  @Column()
  token!: string;

  @FilterableField({ nullable: true })
  @Column({ nullable: true })
  expiresAt!: Date;

  @FilterableField()
  @Column()
  expired!: boolean;

  @BeforeInsert()
  @BeforeUpdate()
  isExpired() {
    this.expired = this.expiresAt ? this.createdAt.getTime() < this.expiresAt?.getTime() : false;
  }
}
