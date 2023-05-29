import { CreateOneInputType, MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType, OmitType, PartialType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { OrderEntity } from "../entities/order.entity";

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
}

@InputType()
export class CreateOrderFromCurrentUserCartInput extends OmitType(PartialType(CreateOrderInput), ["userId"]) {}

@InputType()
export class CreateOneOrderFromCurrentUserCartInputType extends CreateOneInputType("order", CreateOrderFromCurrentUserCartInput) {}

@ArgsType()
export class CreateOneOrderFromCurrentUserCartArgsType extends MutationArgsType(CreateOneOrderFromCurrentUserCartInputType) {}
