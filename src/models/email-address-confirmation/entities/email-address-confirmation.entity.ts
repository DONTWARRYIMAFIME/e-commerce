import { FilterableField, FilterableRelation } from "@nestjs-query/query-graphql";
import { ObjectType } from "@nestjs/graphql";
import { AfterLoad, Column, JoinColumn, ManyToOne, OneToOne } from "typeorm";
import { Entity } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { EmailAddressEntity } from "../../email-address/entities/email-address.entity";
import { UserEntity } from "../../user/entities/user.entity";

@FilterableRelation("user", () => UserEntity)
@FilterableRelation("emailAddress", () => EmailAddressEntity)
@ObjectType("emailAddressConfirmation")
@Entity()
export class EmailAddressConfirmationEntity extends BaseEntity {
  @OneToOne(() => UserEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  user!: UserEntity;

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
  expired!: boolean;

  @AfterLoad()
  isExpired() {
    this.expired = this.createdAt.getTime() < this.expiresAt?.getTime();
  }
}
