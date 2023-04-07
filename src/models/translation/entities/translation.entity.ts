import { FilterableField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { Column, ManyToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { LanguageEntity } from "../../language/entities/language.entity";

@ObjectType()
@Unique("UNQ_translation_key_and_value", ["key", "value"])
@Entity()
export class TranslationEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 128 })
  key!: string;

  @FilterableField()
  @Column({ type: "text" })
  value!: string;

  @FilterableField(() => ID)
  @Column()
  localeId!: string;

  @ManyToOne(() => LanguageEntity)
  locale!: LanguageEntity;
}
