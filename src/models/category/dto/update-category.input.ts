import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateCategoryInput } from "./create-category.input";

@InputType()
export class UpdateCategoryInput extends OmitType(PartialType(CreateCategoryInput), ["code"]) {}
