import { FilterableField } from "@nestjs-query/query-graphql";
import { UserInputError } from "apollo-server-core";
import { BeforeInsert, BeforeUpdate, Column, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { Currencies } from "../enum/currency.enum";

@ObjectType()
@Unique("UNQ_currency_code", ["code"])
@Entity()
export class CurrencyEntity extends BaseEntity {
  @FilterableField()
  @Column({
    type: "enum",
    enum: Currencies,
  })
  code!: Currencies;

  @FilterableField()
  @Column({ length: 32 })
  name!: string;

  @FilterableField()
  @Column({ length: 2 })
  symbol!: string;

  @FilterableField()
  @Column({ default: false })
  isDefault!: boolean;

  @BeforeInsert()
  @BeforeUpdate()
  private async beforeInsertOrUpdate() {
    const defaultExists = await CurrencyEntity.count({ where: { isDefault: true } });
    if (defaultExists !== 0 && this.isDefault) {
      throw new UserInputError("Default currency already specified");
    }
  }
}
