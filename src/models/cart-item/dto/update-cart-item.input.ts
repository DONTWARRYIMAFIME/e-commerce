import { MutationArgsType, UpdateOneInputType } from "@nestjs-query/query-graphql";
import { ArgsType, InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CartItemEntity } from "../entities/cart-item.entity";
import { CreateCartItemInput } from "./create-cart-item.input";

@InputType()
export class UpdateCartItemInput extends OmitType(PartialType(CreateCartItemInput), ["cartId"]) {}

@InputType()
export class UpdateOneCartItemInputType extends UpdateOneInputType(CartItemEntity, UpdateCartItemInput) {}

@ArgsType()
export class UpdateOneCartItemArgsType extends MutationArgsType(UpdateOneCartItemInputType) {}
