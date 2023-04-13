import { Field, InputType, OmitType, PartialType } from "@nestjs/graphql";
import { IsNotEmptyObjectI18N } from "../../../providers/i18n/i18n.decorators";
import { UpdateAddressInput } from "../../address/dto/update-address.input";
import { AddressEntity } from "../../address/entities/address.entity";
import { CreateUserAddressInput } from "./create-user-address.input";

@InputType()
export class UpdateUserAddressInput extends OmitType(PartialType(CreateUserAddressInput), ["userId", "address"]) {
  @IsNotEmptyObjectI18N()
  @Field(() => UpdateAddressInput)
  address!: AddressEntity;
}
