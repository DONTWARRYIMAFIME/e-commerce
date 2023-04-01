import { Field, InputType } from "@nestjs/graphql";
import { IsEnumI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { WarehouseStatusEntity } from "../entities/warehouse-status.entity";
import { WarehouseStatus } from "../enum/warehouse-status.enum";

@InputType()
export class CreateWarehouseStatusInput implements Partial<WarehouseStatusEntity> {
  @IsEnumI18N(WarehouseStatus)
  @Field()
  code!: WarehouseStatus;

  @LengthI18N(2, 24)
  @Field()
  name!: string;
}
