import { Field, InputType } from "@nestjs/graphql";
import { LengthI18N } from "../../../i18n/i18n.decorators";
import { Language } from "../entities/language.entity";

@InputType()
export class CreateLanguageInput implements Partial<Language> {
  @LengthI18N(2, 2)
  @Field()
  code!: string;

  @LengthI18N(2, 64)
  @Field()
  name!: string;
}
