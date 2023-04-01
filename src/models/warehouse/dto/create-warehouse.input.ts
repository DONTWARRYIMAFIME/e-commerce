import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsUpperCaseI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { WarehouseEntity } from "../entities/warehouse.entity";

@InputType()
export class CreateWarehouseInput implements Partial<WarehouseEntity> {
  @LengthI18N(4, 4)
  @IsUpperCaseI18N()
  @Field()
  code!: string;

  @LengthI18N(2, 32)
  @Field()
  name!: string;

  @IsOptional()
  @Field({ nullable: true })
  statusId?: Id;
}
