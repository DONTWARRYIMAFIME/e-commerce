import { MutationArgsType, UpdateOneInputType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType, OmitType, PartialType } from "@nestjs/graphql";
import { IsArrayI18N } from "../../../providers/i18n/i18n.decorators";
import { SelectProductInput } from "../../product/dto/select-product.input";
import { ProductEntity } from "../../product/entities/product.entity";
import { WishlistEntity } from "../entities/wishlist.entity";
import { CreateWishlistInput } from "./create-wishlist.input";

@InputType()
export class UpdateWishlistInput extends OmitType(PartialType(CreateWishlistInput), ["userId"]) {}

@InputType()
export class UpdateOneWishlistInput extends UpdateOneInputType(WishlistEntity, UpdateWishlistInput) {}

@ArgsType()
export class UpdateOneWishlistArgsType extends MutationArgsType(UpdateOneWishlistInput) {}

@InputType()
export class AddProductsToWishlist implements Partial<WishlistEntity> {
  @IsArrayI18N()
  @Field(() => [SelectProductInput])
  products!: ProductEntity[];
}

@InputType()
export class AddProductsToWishlistInputType extends UpdateOneInputType(WishlistEntity, AddProductsToWishlist) {}

@ArgsType()
export class AddProductsToWishlistArgsType extends MutationArgsType(AddProductsToWishlistInputType) {}

@InputType()
export class RemoveProductsFromWishlist implements Partial<WishlistEntity> {
  @IsArrayI18N()
  @Field(() => [SelectProductInput])
  products!: ProductEntity[];
}

@InputType()
export class RemoveProductsFromWishlistInputType extends UpdateOneInputType(WishlistEntity, RemoveProductsFromWishlist) {}

@ArgsType()
export class RemoveProductsFromWishlistArgsType extends MutationArgsType(RemoveProductsFromWishlistInputType) {}
