import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateWarehouseInput } from "./create-warehouse.input";

@InputType()
export class UpdateWarehouseInput extends OmitType(PartialType(CreateWarehouseInput), ["code"]) {}
