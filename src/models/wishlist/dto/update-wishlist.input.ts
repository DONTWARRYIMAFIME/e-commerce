import { MutationArgsType, UpdateOneInputType } from "@nestjs-query/query-graphql";
import { ArgsType, InputType, OmitType, PartialType } from "@nestjs/graphql";
import { WishlistEntity } from "../entities/wishlist.entity";
import { CreateWishlistInput } from "./create-wishlist.input";

@InputType()
export class UpdateWishlistInput extends OmitType(PartialType(CreateWishlistInput), ["userId"]) {}

@InputType()
export class UpdateOneWishlistInput extends UpdateOneInputType(WishlistEntity, UpdateWishlistInput) {}

@ArgsType()
export class UpdateOneWishlistArgsType extends MutationArgsType(UpdateOneWishlistInput) {}
