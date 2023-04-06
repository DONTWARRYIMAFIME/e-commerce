import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateCityInput } from "./create-city.input";

@InputType()
export class UpdateCityInput extends OmitType(PartialType(CreateCityInput), ["countryId"]) {}
