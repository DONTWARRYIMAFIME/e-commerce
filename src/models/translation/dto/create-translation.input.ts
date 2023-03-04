import { Field, InputType } from "@nestjs/graphql";
import { LengthI18N, MinLengthI18N } from "../../../i18n/i18n.decorators";
import { Translation } from "../entities/translation.entity";

@InputType()
export class CreateTranslationInput implements Partial<Translation> {
  @LengthI18N(2, 128)
  @Field()
  key: string;

  @MinLengthI18N(2)
  @Field()
  value: string;
}
