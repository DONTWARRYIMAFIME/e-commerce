import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { UpdateCartItemInput } from "../../cart-item/dto/update-cart-item.input";
import { CartItemEntity } from "../../cart-item/entities/cart-item.entity";
import { CartEntity } from "../entities/cart.entity";

@InputType()
export class CreateCartInput implements Partial<CartEntity> {
  @IsUUIDI18N()
  @Field()
  userId!: Id;

  @IsOptional()
  @Field(() => [UpdateCartItemInput], { defaultValue: [] })
  cartItems!: CartItemEntity[];
}
