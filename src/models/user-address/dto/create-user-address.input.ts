import { Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsNotEmptyObjectI18N, IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { CreateAddressInput } from "../../address/dto/create-address.input";
import { AddressEntity } from "../../address/entities/address.entity";
import { UserAddressEntity } from "../entities/user-address.entity";

@InputType()
export class CreateUserAddressInput implements Partial<UserAddressEntity> {
  @IsUUIDI18N()
  @Field()
  userId!: Id;

  @IsNotEmptyObjectI18N()
  @Field(() => CreateAddressInput)
  address: AddressEntity;
}
