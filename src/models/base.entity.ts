import { GraphQLISODateTime, ID, ObjectType } from "@nestjs/graphql";
import { FilterableField, IDField } from "@ptc-org/nestjs-query-graphql";
import { BaseEntity as TBaseEntity, CreateDateColumn, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import { Id } from "../common/types/id.type";

@ObjectType()
export class BaseEntity extends TBaseEntity {
  @IDField(() => ID)
  @PrimaryGeneratedColumn("uuid")
  id!: Id;

  @FilterableField(() => GraphQLISODateTime)
  @CreateDateColumn()
  createdAt!: Date;

  @FilterableField(() => GraphQLISODateTime)
  @UpdateDateColumn()
  updatedAt!: Date;
}
