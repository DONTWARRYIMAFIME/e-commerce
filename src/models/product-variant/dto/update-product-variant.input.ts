import { InputType, PartialType } from "@nestjs/graphql";
import { CreateProductVariantInput } from "./create-product-variant.input";

@InputType()
export class UpdateProductVariantInput extends PartialType(CreateProductVariantInput) {}
