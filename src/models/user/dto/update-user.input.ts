import { MutationArgsType, UpdateOneInputType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType, OmitType, PartialType } from "@nestjs/graphql";
import { Length } from "class-validator";
import { UserEntity } from "../entities/user.entity";
import { CreateUserInput } from "./create-user.input";

@InputType()
export class UpdateUserInput extends OmitType(PartialType(CreateUserInput), ["password"]) {
  @Length(2, 64)
  @Field({ nullable: true })
  firstName: string;

  @Length(2, 128)
  @Field({ nullable: true })
  lastName: string;
}

@InputType()
export class UpdateOneUserInputType extends UpdateOneInputType(UserEntity, UpdateUserInput) {}

@ArgsType()
export class UpdateOneUserArgsType extends MutationArgsType(UpdateOneUserInputType) {}
