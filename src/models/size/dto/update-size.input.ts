import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateSizeInput } from "./create-size.input";

@InputType()
export class UpdateSizeInput extends OmitType(PartialType(CreateSizeInput), ["code"]) {}
