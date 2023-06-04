import { ArgsType, Field, InputType, OmitType, PartialType } from "@nestjs/graphql";
import { MutationArgsType, UpdateOneInputType } from "@ptc-org/nestjs-query-graphql";
import { IsArrayI18N } from "../../../providers/i18n/i18n.decorators";
import { ManageWarehouseItem, WarehouseItemsInput } from "../../warehouse-item/dto/manage-warehouse-item.input";
import { WarehouseEntity } from "../entities/warehouse.entity";
import { CreateWarehouseInput } from "./create-warehouse.input";

@InputType()
export class UpdateWarehouseInput extends OmitType(PartialType(CreateWarehouseInput), ["code"]) {}

@InputType()
export class WarehouseInput {
  @IsArrayI18N()
  @Field(() => [WarehouseItemsInput])
  warehouseItems!: ManageWarehouseItem[];
}

@InputType()
export class UpdateOneWarehouseInputType extends UpdateOneInputType(WarehouseEntity, WarehouseInput) {}

@ArgsType()
export class UpdateOneWarehouseArgsType extends MutationArgsType(UpdateOneWarehouseInputType) {}
