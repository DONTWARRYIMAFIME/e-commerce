import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateProductVariantInput } from "./create-product-variant.input";

@InputType()
export class UpdateProductVariantInput extends OmitType(PartialType(CreateProductVariantInput), ["productId"]) {}
