import { ArgsType, InputType, OmitType, PartialType } from "@nestjs/graphql";
import { MutationArgsType } from "@ptc-org/nestjs-query-graphql";
import { CreateUserInput } from "./create-user.input";

@InputType()
export class UpdateUserInput extends OmitType(PartialType(CreateUserInput), ["password", "passwordConfirmation", "email"]) {}

@ArgsType()
export class UpdateOneUserArgsType extends MutationArgsType(UpdateUserInput) {}
