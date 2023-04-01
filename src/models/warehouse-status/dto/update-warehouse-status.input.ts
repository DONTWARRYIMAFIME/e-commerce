import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateWarehouseStatusInput } from "./create-warehouse-status.input";

@InputType()
export class UpdateWarehouseStatusInput extends OmitType(PartialType(CreateWarehouseStatusInput), ["code"]) {}
