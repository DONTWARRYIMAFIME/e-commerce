import { Field, InputType } from "@nestjs/graphql";
import { IsNotEmptyI18N, IsSnakeCaseI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { CreatePriceInput } from "../../price/dto/create-price.input";
import { PriceEntity } from "../../price/entities/price.entity";
import { PromotionEntity } from "../entities/promotion.entity";

@InputType()
export class CreatePromotionInput implements Partial<PromotionEntity> {
  @LengthI18N(2, 128)
  @IsSnakeCaseI18N()
  @Field()
  code!: string;

  @LengthI18N(2, 256)
  @Field()
  name!: string;

  @IsNotEmptyI18N()
  @Field(() => CreatePriceInput)
  price!: PriceEntity;
}
