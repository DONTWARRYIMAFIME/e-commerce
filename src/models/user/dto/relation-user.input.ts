import { MutationArgsType, UpdateOneInputType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { IsArrayI18N } from "../../../providers/i18n/i18n.decorators";
import { CreateAddressInput } from "../../address/dto/create-address.input";
import { SelectAddressInput } from "../../address/dto/select-address.input";
import { AddressEntity } from "../../address/entities/address.entity";
import { UserEntity } from "../entities/user.entity";

@InputType()
export class AddAddressesToUserInput implements Partial<UserEntity> {
  @IsArrayI18N()
  @Field(() => [CreateAddressInput])
  addresses!: AddressEntity[];
}

@InputType()
export class AddAddressesToUserInputType extends UpdateOneInputType(UserEntity, AddAddressesToUserInput) {}

@ArgsType()
export class AddAddressesToUserArgsType extends MutationArgsType(AddAddressesToUserInputType) {}

@InputType()
export class RemoveAddressesFromUserInput implements Partial<UserEntity> {
  @IsArrayI18N()
  @Field(() => [SelectAddressInput])
  addresses!: AddressEntity[];
}

@InputType()
export class RemoveAddressesFromUserInputType extends UpdateOneInputType(UserEntity, RemoveAddressesFromUserInput) {}

@ArgsType()
export class RemoveAddressesFromUserArgsType extends MutationArgsType(RemoveAddressesFromUserInputType) {}
