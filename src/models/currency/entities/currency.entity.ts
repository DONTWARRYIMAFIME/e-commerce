import { FilterableField } from "@nestjs-query/query-graphql";
import { Unique, Column } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { Currency } from "../enum/currency.enum";

@ObjectType()
@Unique("UNQ_currency_code", ["code"])
@Entity()
export class CurrencyEntity extends BaseEntity {
  @FilterableField()
  @Column({
    type: "enum",
    enum: Currency,
  })
  code!: Currency;

  @FilterableField()
  @Column({ length: 32 })
  name!: string;

  @FilterableField()
  @Column({ length: 2 })
  symbol!: string;
}
