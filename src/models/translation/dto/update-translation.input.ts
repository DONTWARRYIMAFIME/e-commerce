import { InputType, PartialType } from "@nestjs/graphql";
import { CreateTranslationInput } from "./create-translation.input";

@InputType()
export class UpdateTranslationInput extends PartialType(CreateTranslationInput) {}
