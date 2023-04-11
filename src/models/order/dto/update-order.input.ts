import { DeleteOneInputType, MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, InputType, PartialType, PickType } from "@nestjs/graphql";
import { OrderEntity } from "../entities/order.entity";
import { CreateOrderInput } from "./create-order.input";

@InputType()
export class UpdateOrderInput extends PickType(PartialType(CreateOrderInput), ["status"]) {}

@InputType()
export class CancelOrderInputType extends DeleteOneInputType(OrderEntity) {}

@ArgsType()
export class CancelOrderArgsType extends MutationArgsType(CancelOrderInputType) {}
