import { InputType, PartialType } from "@nestjs/graphql";
import { CreateColorInput } from "./create-color.input";

@InputType()
export class UpdateColorInput extends PartialType(CreateColorInput) {}
