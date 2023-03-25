import { FilterableField, IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { BaseEntity as TBaseEntity, CreateDateColumn, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import { Id } from "../common/types/id.type";

@ObjectType()
export class BaseEntity extends TBaseEntity {
  @IDField(() => ID)
  @PrimaryGeneratedColumn("uuid")
  id!: Id;

  @FilterableField()
  @CreateDateColumn()
  createdAt!: Date;

  @FilterableField()
  @UpdateDateColumn()
  updatedAt!: Date;
}
