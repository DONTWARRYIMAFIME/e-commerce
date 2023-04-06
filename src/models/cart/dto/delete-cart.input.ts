import { DeleteOneInputType, MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, InputType } from "@nestjs/graphql";
import { CartEntity } from "../entities/cart.entity";

@InputType()
export class DeleteOneCartInputType extends DeleteOneInputType(CartEntity) {}

@ArgsType()
export class DeleteOneCartArgsType extends MutationArgsType(DeleteOneCartInputType) {}
