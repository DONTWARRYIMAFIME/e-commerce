import { InputType, PartialType } from "@nestjs/graphql";
import { CreateWishlistInput } from "./create-wishlist.input";

@InputType()
export class UpdateWishlistInput extends PartialType(CreateWishlistInput) {}
