import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreatePriceInput } from "./create-price.input";

@InputType()
export class UpdatePriceInput extends OmitType(PartialType(CreatePriceInput), ["currencyId"]) {}
