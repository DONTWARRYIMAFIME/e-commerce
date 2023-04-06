import { Field, InputType } from "@nestjs/graphql";
import { IsHexColorI18N, IsSnakeCaseI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { ColorEntity } from "../entities/color.entity";

@InputType()
export class CreateColorInput implements Partial<ColorEntity> {
  @LengthI18N(2, 32)
  @IsSnakeCaseI18N()
  @Field()
  code!: string;

  @LengthI18N(2, 64)
  @Field()
  name!: string;

  @IsHexColorI18N()
  @Field()
  hex!: string;
}
