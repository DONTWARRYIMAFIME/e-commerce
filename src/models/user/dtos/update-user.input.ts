import { CreateOneInputType, MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { Length } from "class-validator";
import { User } from "../entities/user.entity";

@InputType()
export class UpdateUserInput implements Partial<User> {
  @Length(2, 64)
  @Field({ nullable: true })
  firstName: string;

  @Length(2, 128)
  @Field({ nullable: true })
  lastName: string;
}

@InputType()
export class UpdateOneUserInputType extends CreateOneInputType("user", UpdateUserInput) {}

@ArgsType()
export class UpdateOneUserArgsType extends MutationArgsType(UpdateUserInput) {}
