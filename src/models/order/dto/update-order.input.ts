import { DeleteOneInputType, MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, InputType, OmitType, PartialType } from "@nestjs/graphql";
import { OrderEntity } from "../entities/order.entity";
import { CreateOrderInput } from "./create-order.input";

@InputType()
export class UpdateOrderInput extends OmitType(PartialType(CreateOrderInput), ["userId"]) {}

@InputType()
export class UpdateOrderInputType extends DeleteOneInputType(OrderEntity) {}

@ArgsType()
export class UpdateOrderArgsType extends MutationArgsType(UpdateOrderInputType) {}
