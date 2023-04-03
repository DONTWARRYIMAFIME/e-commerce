import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateCartItemInput } from "./create-cart-item.input";

@InputType()
export class UpdateCartItemInput extends OmitType(PartialType(CreateCartItemInput), ["cartId"]) {}
