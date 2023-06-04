import { ArgsType, InputType } from "@nestjs/graphql";
import { MutationArgsType, UpdateOneInputType } from "@ptc-org/nestjs-query-graphql";
import { UserEntity } from "../entities/user.entity";

@InputType()
export class AddAddressesToUserInput implements Partial<UserEntity> {
  // @IsArrayI18N()
  // @Field(() => [CreateAddressInput])
  // addresses!: AddressEntity[];
}

@InputType()
export class AddAddressesToUserInputType extends UpdateOneInputType(UserEntity, AddAddressesToUserInput) {}

@ArgsType()
export class AddAddressesToUserArgsType extends MutationArgsType(AddAddressesToUserInputType) {}

@InputType()
export class RemoveAddressesFromUserInput implements Partial<UserEntity> {
  // @IsArrayI18N()
  // @Field(() => [SelectAddressInput])
  // addresses!: AddressEntity[];
}

@InputType()
export class RemoveAddressesFromUserInputType extends UpdateOneInputType(UserEntity, RemoveAddressesFromUserInput) {}

@ArgsType()
export class RemoveAddressesFromUserArgsType extends MutationArgsType(RemoveAddressesFromUserInputType) {}
