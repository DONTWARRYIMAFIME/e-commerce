import { FilterableField, FilterableRelation } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { BeforeInsert, BeforeUpdate, Column, Index, ManyToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { ColumnNumericTransformer } from "../../../common/helpers/typeorm/numeric.transformer";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { CurrencyEntity } from "../../currency/entities/currency.entity";

@FilterableRelation("currency", () => CurrencyEntity)
@ObjectType()
@Index("INX_price_currency_id", ["currencyId"])
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

  @FilterableField(() => ID)
  @Column()
  currencyId!: Id;

  @ManyToOne(() => CurrencyEntity, {
    eager: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  currency!: CurrencyEntity;

  @BeforeInsert()
  @BeforeUpdate()
  private async beforeInsertOrUpdate() {
    // If currency isn't specified use default one
    if (!this.currencyId) {
      this.currency = await CurrencyEntity.findOneBy({ isDefault: true });
    }
  }
}
