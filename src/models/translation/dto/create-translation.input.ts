import { Field, InputType } from "@nestjs/graphql";
import { LengthI18N, MinLengthI18N } from "../../../providers/i18n/i18n.decorators";
import { TranslationEntity } from "../entities/translation.entity";

@InputType()
export class CreateTranslationInput implements Partial<TranslationEntity> {
  @LengthI18N(2, 128)
  @Field()
  key: string;

  @MinLengthI18N(2)
  @Field()
  value: string;
}
