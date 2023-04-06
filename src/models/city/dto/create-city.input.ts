import { Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { CityEntity } from "../entities/city.entity";

@InputType()
export class CreateCityInput implements Partial<CityEntity> {
  @LengthI18N(2, 128)
  @Field()
  name!: string;

  @IsUUIDI18N()
  @Field()
  countryId!: Id;
}
