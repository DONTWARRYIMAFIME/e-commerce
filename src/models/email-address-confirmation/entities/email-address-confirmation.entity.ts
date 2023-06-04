import { ID } from "@nestjs/graphql";
import { FilterableField, FilterableRelation } from "@ptc-org/nestjs-query-graphql";
import { Column, Index, JoinColumn, OneToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { EmailAddressEntity } from "../../email-address/entities/email-address.entity";
import { UserEntity } from "../../user/entities/user.entity";

@Authorize()
@FilterableRelation("user", () => UserEntity)
@FilterableRelation("emailAddress", () => EmailAddressEntity)
@ObjectType()
@Unique("UNQ_email_address_confirmation_token", ["token"])
@Index("INX_email_address_confirmation_user", ["user"])
@Index("INX_email_address_confirmation_email_address", ["emailAddress"])
@Entity()
export class EmailAddressConfirmationEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  userId!: Id;

  @OneToOne(() => UserEntity, {
    eager: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  user!: UserEntity;

  @FilterableField(() => ID)
  @Column()
  emailAddressId!: Id;

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
