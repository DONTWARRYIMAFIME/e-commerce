import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsPositiveI18N, IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { PromotionProductEntity } from "../entities/promotion-product.entity";

@InputType()
export class CreatePromotionProductInput implements Partial<PromotionProductEntity> {
  @IsUUIDI18N()
  @Field()
  productId!: Id;

  @IsUUIDI18N()
  @Field()
  promotionId!: Id;

  @IsOptional()
  @IsPositiveI18N()
  @Field({ defaultValue: 1 })
  promotionLengthInDays!: number;
}
