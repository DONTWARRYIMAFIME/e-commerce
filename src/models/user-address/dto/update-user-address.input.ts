import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateUserAddressInput } from "./create-user-address.input";

@InputType()
export class UpdateUserAddressInput extends OmitType(PartialType(CreateUserAddressInput), ["userId"]) {}
