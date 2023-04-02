import { MutationArgsType, UpdateOneInputType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsPositiveI18N, IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { WarehouseEntity } from "../../warehouse/entities/warehouse.entity";

@InputType()
export class WarehouseItemsInput {
  @IsUUIDI18N()
  @Field()
  productVariantId!: Id;

  @IsOptional()
  @IsPositiveI18N()
  @Field({ defaultValue: 1 })
  quantity!: number;
}

@InputType()
export class ManageWarehouseItemsInput extends UpdateOneInputType(WarehouseEntity, WarehouseItemsInput) {}

@ArgsType()
export class ManageWarehouseItemsArgsType extends MutationArgsType(ManageWarehouseItemsInput) {}
