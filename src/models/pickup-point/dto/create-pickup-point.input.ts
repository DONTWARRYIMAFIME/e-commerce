import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { IsEnumI18N, IsNotEmptyI18N, IsUpperCaseI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { CreateAddressInput } from "../../address/dto/create-address.input";
import { AddressEntity } from "../../address/entities/address.entity";
import { PickupPointEntity } from "../entities/pickup-point.entity";
import { PickupPointStatus } from "../enums/pickup-point-status.enum";

@InputType()
export class CreatePickupPointInput implements Partial<PickupPointEntity> {
  @LengthI18N(6, 6)
  @IsUpperCaseI18N()
  @Field()
  code!: string;

  @LengthI18N(2, 128)
  @Field()
  name!: string;

  @IsOptional()
  @IsEnumI18N(PickupPointStatus)
  @Field(() => PickupPointStatus, { nullable: true })
  status?: PickupPointStatus;

  @IsNotEmptyI18N()
  @Field(() => CreateAddressInput)
  address!: AddressEntity;
}
