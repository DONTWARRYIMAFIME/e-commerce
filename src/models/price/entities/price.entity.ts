import { FilterableField } from "@nestjs-query/query-graphql";
import { Column, Index } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { ColumnNumericTransformer } from "../../../common/helpers/typeorm/numeric.transformer";
import { BaseEntity } from "../../base.entity";
import { Currencies } from "../enums/currencies.enum";

@Authorize()
@ObjectType()
@Index("INX_price_currency", ["currency"])
@Entity()
export class PriceEntity extends BaseEntity {
  @FilterableField()
  @Column({
    name: "amount",
    type: "numeric",
    precision: 10,
    scale: 2,
    default: 0,
    transformer: new ColumnNumericTransformer(),
  })
  amount!: number;

  @FilterableField(() => Currencies)
  @Column({
    type: "enum",
    enum: Currencies,
    default: Currencies.BYN,
  })
  currency!: Currencies;
}
