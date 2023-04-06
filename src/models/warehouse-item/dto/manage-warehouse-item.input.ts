import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsPositiveI18N, IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { WarehouseItemEntity } from "../entities/warehouse-item.entity";

export type ManageWarehouseItem = Pick<WarehouseItemEntity, "productVariantId"> & { quantity: number };

@InputType()
export class WarehouseItemsInput implements ManageWarehouseItem {
  @IsUUIDI18N()
  @Field()
  productVariantId!: Id;

  @IsOptional()
  @IsPositiveI18N()
  @Field({ defaultValue: 1 })
  quantity!: number;
}
