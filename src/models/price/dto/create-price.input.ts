import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { IsEnumI18N, IsPositiveI18N } from "../../../providers/i18n/i18n.decorators";
import { PriceEntity } from "../entities/price.entity";
import { Currencies } from "../enums/currencies.enum";

@InputType()
export class CreatePriceInput implements Partial<PriceEntity> {
  @IsPositiveI18N()
  @Field()
  amount!: number;

  @IsOptional()
  @IsEnumI18N(Currencies)
  @Field({ nullable: true })
  currency?: Currencies;
}
