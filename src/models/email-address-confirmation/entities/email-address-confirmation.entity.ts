import { FilterableField, FilterableRelation, Relation } from "@nestjs-query/query-graphql";
import { Column, JoinColumn, OneToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { EmailAddressEntity } from "../../email-address/entities/email-address.entity";
import { UserEntity } from "../../user/entities/user.entity";

@Relation("user", () => UserEntity)
@FilterableRelation("emailAddress", () => EmailAddressEntity)
@ObjectType()
@Unique("UNQ_email_address_confirmation_token", ["token"])
@Entity()
export class EmailAddressConfirmationEntity extends BaseEntity {
  @OneToOne(() => UserEntity, {
    eager: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  user!: UserEntity;

  @OneToOne(() => EmailAddressEntity, {
    eager: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  emailAddress!: EmailAddressEntity;

  @FilterableField()
  @Column()
  token!: string;
}
