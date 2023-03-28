import { Field, InputType } from "@nestjs/graphql";
import { LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { LanguageEntity } from "../entities/language.entity";

@InputType()
export class CreateLanguageInput implements Partial<LanguageEntity> {
  @LengthI18N(2, 2)
  @Field()
  code!: string;

  @LengthI18N(2, 64)
  @Field()
  name!: string;
}
