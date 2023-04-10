import { InputType, PartialType } from "@nestjs/graphql";
import { CreateUserAddressInput } from "./create-user-address.input";

@InputType()
export class UpdateUserAddressInput extends PartialType(CreateUserAddressInput) {}
