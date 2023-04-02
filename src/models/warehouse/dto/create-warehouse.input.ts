import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsUpperCaseI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { CreateAddressInput } from "../../address/dto/create-address.input";
import { AddressEntity } from "../../address/entities/address.entity";
import { UpdateWarehouseItemInput } from "../../warehouse-item/dto/update-warehouse-item.input";
import { WarehouseItemEntity } from "../../warehouse-item/entities/warehouse-item.entity";
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

  @IsOptional()
  @Field(() => CreateAddressInput, { nullable: true })
  address?: AddressEntity;

  @IsOptional()
  @Field(() => [UpdateWarehouseItemInput], { nullable: true, defaultValue: [] })
  warehouseItems?: WarehouseItemEntity[];
}