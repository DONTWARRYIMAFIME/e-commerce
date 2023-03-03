import { FilterableField, IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { BaseEntity as TBaseEntity, CreateDateColumn, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";

@ObjectType()
export class BaseEntity extends TBaseEntity {
  @IDField(() => ID)
  @PrimaryGeneratedColumn("uuid")
  id!: string;

  @FilterableField()
  @CreateDateColumn()
  createdAt!: Date;

  @FilterableField()
  @UpdateDateColumn()
  updatedAt!: Date;
}
