import { FilterableField, IDField } from "@nestjs-query/query-graphql";
import { GraphQLISODateTime, ID, ObjectType } from "@nestjs/graphql";
import { BaseEntity as TBaseEntity, CreateDateColumn, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import { Id } from "../common/types/id.type";

@ObjectType()
export class BaseEntity extends TBaseEntity {
  @IDField(() => ID)
  @PrimaryGeneratedColumn("uuid")
  id!: Id;

  @FilterableField(() => GraphQLISODateTime, { filterOnly: true })
  @CreateDateColumn()
  createdAt!: Date;

  @FilterableField(() => GraphQLISODateTime, { filterOnly: true })
  @UpdateDateColumn()
  updatedAt!: Date;
}
