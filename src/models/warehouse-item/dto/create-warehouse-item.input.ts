import { Optional } from "@nestjs/common";
import { Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsBigIntI18N, IsPositiveI18N } from "../../../providers/i18n/i18n.decorators";
import { WarehouseItemEntity } from "../entities/warehouse-item.entity";

@InputType()
export class CreateWarehouseItemInput implements Partial<WarehouseItemEntity> {
  @IsBigIntI18N()
  @Field()
  warehouseId!: Id;

  @IsBigIntI18N()
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
