import { Optional } from "@nestjs/common";
import { Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsPositiveI18N, IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { WarehouseItemEntity } from "../entities/warehouse-item.entity";

@InputType()
export class CreateWarehouseItemInput implements Partial<WarehouseItemEntity> {
  @IsUUIDI18N()
  @Field()
  warehouseId!: Id;

  @IsUUIDI18N()
  @Field()
  productVariantId!: Id;

  @Optional()
  @IsPositiveI18N()
  @Field({ nullable: true, defaultValue: 0 })
  stock?: number;

  @Optional()
  @IsPositiveI18N()
  @Field({ nullable: true, defaultValue: 0 })
  reserved?: number;
}
