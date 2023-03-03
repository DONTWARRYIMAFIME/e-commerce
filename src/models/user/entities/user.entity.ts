import { FilterableField } from "@nestjs-query/query-graphql";
import { HideField, ObjectType } from "@nestjs/graphql";
import { Column, Entity, Unique } from "typeorm";
import { BaseEntity } from "../../base.entity";

@ObjectType()
@Unique("UNQ_user_email", ["email"])
@Entity()
export class User extends BaseEntity {
  @FilterableField()
  @Column()
  email!: string;

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
