import { ArgsType, InputType } from "@nestjs/graphql";
import { DeleteOneInputType, MutationArgsType } from "@ptc-org/nestjs-query-graphql";
import { CartEntity } from "../entities/cart.entity";

@InputType()
export class DeleteOneCartInputType extends DeleteOneInputType(CartEntity) {}

@ArgsType()
export class DeleteOneCartArgsType extends MutationArgsType(DeleteOneCartInputType) {}
