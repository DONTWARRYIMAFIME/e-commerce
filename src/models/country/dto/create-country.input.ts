import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { IsEnumI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { UpdateCityInput } from "../../city/dto/update-city.input";
import { CityEntity } from "../../city/entities/city.entity";
import { CountryEntity } from "../entities/country.entity";
import { Country } from "../enums/country.enum";

@InputType()
export class CreateCountryInput implements Partial<CountryEntity> {
  @IsEnumI18N(Country)
  @Field()
  code!: Country;

  @LengthI18N(2, 128)
  @Field()
  name!: string;

  @IsOptional()
  @Field(() => [UpdateCityInput], { nullable: true, defaultValue: [] })
  cities?: CityEntity[];
}
