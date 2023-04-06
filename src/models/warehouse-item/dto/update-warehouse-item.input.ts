import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateWarehouseItemInput } from "./create-warehouse-item.input";

@InputType()
export class UpdateWarehouseItemInput extends OmitType(PartialType(CreateWarehouseItemInput), ["warehouseId"]) {}
