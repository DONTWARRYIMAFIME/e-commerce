import { Field, InputType, Int } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsPositiveI18N, IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { OrderItemEntity } from "../entities/order-item.entity";

@InputType()
export class CreateOrderItemInput implements Partial<OrderItemEntity> {
  @IsUUIDI18N()
  @Field()
  orderId!: Id;

  @IsUUIDI18N()
  @Field()
  productVariantId!: Id;

  @IsUUIDI18N()
  @Field()
  warehouseId!: Id;

  @IsOptional()
  @IsPositiveI18N()
  @Field(() => Int, { defaultValue: 1 })
  quantity: number;
}
