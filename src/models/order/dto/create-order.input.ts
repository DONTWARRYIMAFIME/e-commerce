import { CreateOneInputType, MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType, PartialType, PickType } from "@nestjs/graphql";
import { IsEnum, IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsNotEmptyI18N, IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { CreatePriceInput } from "../../price/dto/create-price.input";
import { PriceEntity } from "../../price/entities/price.entity";
import { OrderEntity } from "../entities/order.entity";
import { OrderStatus } from "../enums/order-status.enum";

@InputType()
export class CreateOrderInput implements Partial<OrderEntity> {
  @IsUUIDI18N()
  @Field()
  userId!: Id;

  @IsUUIDI18N()
  @Field()
  paymentMethodId!: Id;

  @IsUUIDI18N()
  @Field()
  deliveryMethodId!: Id;

  @IsUUIDI18N()
  @Field()
  deliveryAddressId!: Id;

  @IsNotEmptyI18N()
  @Field(() => CreatePriceInput)
  subtotalPrice!: PriceEntity;

  @IsOptional()
  @IsEnum(OrderStatus)
  @Field(() => OrderStatus, { nullable: true })
  status?: OrderStatus;
}

@InputType()
export class CreateOrderFromCurrentUserCartInput extends PickType(PartialType(CreateOrderInput), ["paymentMethodId", "deliveryMethodId", "deliveryAddressId"]) {}

@InputType()
export class CreateOneOrderFromCurrentUserCartInputType extends CreateOneInputType("order", CreateOrderFromCurrentUserCartInput) {}

@ArgsType()
export class CreateOneOrderFromCurrentUserCartArgsType extends MutationArgsType(CreateOneOrderFromCurrentUserCartInputType) {}
