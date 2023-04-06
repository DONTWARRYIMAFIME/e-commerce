import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateBrandInput } from "./create-brand.input";

@InputType()
export class UpdateBrandInput extends OmitType(PartialType(CreateBrandInput), ["userId"]) {}
