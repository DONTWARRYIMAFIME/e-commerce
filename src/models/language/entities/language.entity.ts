import { FilterableField } from "@nestjs-query/query-graphql";
import { Column, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";

@ObjectType()
@Unique("UNQ_language_code", ["code"])
@Entity()
export class LanguageEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 2 })
  code!: string;

  @FilterableField()
  @Column({ length: 64 })
  name!: string;
}
