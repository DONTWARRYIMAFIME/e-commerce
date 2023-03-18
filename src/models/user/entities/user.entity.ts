import { FilterableField, FilterableRelation } from "@nestjs-query/query-graphql";
import { HideField, ObjectType } from "@nestjs/graphql";
import { Column, Entity, ManyToOne } from "typeorm";
import { BaseEntity } from "../../base.entity";
import { EmailAddress } from "../../email-address/entities/email-address.entity";

@FilterableRelation("emailAddress", () => EmailAddress)
@ObjectType()
@Entity()
export class User extends BaseEntity {
  @FilterableField()
  email!: string;

  @HideField()
  @ManyToOne(() => EmailAddress, { eager: true, cascade: true, onUpdate: "CASCADE", onDelete: "CASCADE" })
  emailAddress!: EmailAddress;

  @FilterableField({ nullable: true })
  @Column({ nullable: true })
  phone?: string;

  @FilterableField({ nullable: true })
  @Column({ length: 64, nullable: true })
  firstName?: string;

  @FilterableField({ nullable: true })
  @Column({ length: 128, nullable: true })
  lastName?: string;

  @HideField()
  @Column()
  password!: string;

  @HideField()
  tempPassword: string;
}
