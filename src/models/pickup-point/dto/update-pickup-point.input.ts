import { Field, InputType, OmitType, PartialType } from "@nestjs/graphql";
import { IsNotEmptyI18N } from "../../../providers/i18n/i18n.decorators";
import { UpdateAddressInput } from "../../address/dto/update-address.input";
import { AddressEntity } from "../../address/entities/address.entity";
import { CreatePickupPointInput } from "./create-pickup-point.input";

@InputType()
export class UpdatePickupPointInput extends OmitType(PartialType(CreatePickupPointInput), ["code"]) {
  @IsNotEmptyI18N()
  @Field(() => UpdateAddressInput)
  address!: AddressEntity;
}
