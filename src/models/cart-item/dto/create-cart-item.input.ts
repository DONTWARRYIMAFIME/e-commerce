import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsPositiveI18N, IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { CartItemEntity } from "../entities/cart-item.entity";

@InputType()
export class CreateCartItemInput implements Partial<CartItemEntity> {
  @IsUUIDI18N()
  @Field()
  cartId!: Id;

  @IsUUIDI18N()
  @Field()
  productVariantId!: Id;

  @IsOptional()
  @IsPositiveI18N()
  @Field({ defaultValue: 1 })
  quantity?: number;
}
