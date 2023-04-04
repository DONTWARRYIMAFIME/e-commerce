import { Field, InputType } from "@nestjs/graphql";
import { IsEnumI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { CurrencyEntity } from "../entities/currency.entity";
import { Currencies } from "../enum/currency.enum";

@InputType()
export class CreateCurrencyInput implements Partial<CurrencyEntity> {
  @IsEnumI18N(Currencies)
  @Field()
  code!: Currencies;

  @LengthI18N(3, 32)
  @Field()
  name!: string;

  @LengthI18N(1, 2)
  @Field()
  symbol!: string;
}
