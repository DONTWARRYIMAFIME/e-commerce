import { Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsSnakeCaseI18N, IsUUIDI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { BrandEntity } from "../entities/brand.entity";

@InputType()
export class CreateBrandInput implements Partial<BrandEntity> {
  @LengthI18N(2, 32)
  @IsSnakeCaseI18N()
  @Field()
  code!: string;

  @LengthI18N(2, 32)
  @Field()
  name!: string;

  @IsUUIDI18N()
  @Field()
  userId!: Id;

  @IsUUIDI18N()
  @Field()
  categoryId!: Id;

  @IsUUIDI18N()
  @Field()
  brandId!: Id;
}
