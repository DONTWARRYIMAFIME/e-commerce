import { Field, ID, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { WarehouseItemEntity } from "../entities/warehouse-item.entity";

@InputType()
export class ReadWarehouseItemInput implements Partial<WarehouseItemEntity> {
  @IsUUIDI18N()
  @Field(() => ID)
  warehouseId: Id;

  @IsUUIDI18N()
  @Field(() => ID)
  productVariantId: Id;
}
