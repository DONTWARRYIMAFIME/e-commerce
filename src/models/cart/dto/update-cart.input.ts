import { ArgsType, InputType, OmitType, PartialType } from "@nestjs/graphql";
import { MutationArgsType, UpdateOneInputType } from "@ptc-org/nestjs-query-graphql";
import { CartEntity } from "../entities/cart.entity";
import { CreateCartInput } from "./create-cart.input";

@InputType()
export class UpdateCartInput extends OmitType(PartialType(CreateCartInput), ["userId"]) {}

@InputType()
export class UpdateOneCartInputType extends UpdateOneInputType(CartEntity, UpdateCartInput) {}

@ArgsType()
export class UpdateOneCartArgsType extends MutationArgsType(UpdateOneCartInputType) {}
