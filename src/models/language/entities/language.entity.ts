import { FilterableField } from "@nestjs-query/query-graphql";
import { ObjectType } from "@nestjs/graphql";
import { Column, Entity, Unique } from "typeorm";
import { BaseEntity } from "../../base.entity";

@ObjectType()
@Unique("UNQ_language_code", ["code"])
@Entity()
export class Language extends BaseEntity {
  @FilterableField()
  @Column({ length: 2 })
  code!: string;

  @FilterableField()
  @Column({ length: 64 })
  name!: string;
}
