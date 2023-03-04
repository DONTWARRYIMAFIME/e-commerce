import { FilterableField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { Column, Entity, ManyToOne, Unique } from "typeorm";
import { BaseEntity } from "../../base.entity";
import { Language } from "../../language/entities/language.entity";

@ObjectType()
@Unique("UNQ_translation_key_and_value", ["key", "value"])
@Entity()
export class Translation extends BaseEntity {
  @FilterableField()
  @Column({ length: 128 })
  key!: string;

  @FilterableField()
  @Column({ type: "text" })
  value!: string;

  @FilterableField(() => ID)
  @Column()
  localeId!: string;

  @ManyToOne(() => Language)
  locale!: Language;
}
