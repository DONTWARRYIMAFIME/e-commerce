import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { CreateOneInputType, MutationArgsType } from "@ptc-org/nestjs-query-graphql";
import { Allow, IsOptional, IsPhoneNumber } from "class-validator";
import { IsEmailI18N, IsEmailNotExistsI18N, IsEqualToI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { UserEntity } from "../entities/user.entity";

@InputType()
export class CreateUserInput implements Partial<UserEntity> {
  @IsEmailI18N()
  @IsEmailNotExistsI18N()
  @Field()
  email!: string;

  @IsOptional()
  @IsPhoneNumber()
  @Field(() => String, { nullable: true })
  phone!: string;

  @LengthI18N(2, 64)
  @Field()
  firstName!: string;

  @LengthI18N(2, 128)
  @Field()
  lastName!: string;

  @Allow()
  //@IsHash("sha512")
  @Field()
  password!: string;

  @IsEqualToI18N<CreateUserInput>("password")
  @Field()
  passwordConfirmation!: string;
}

@InputType()
export class CreateOneUserInput extends CreateOneInputType("user", CreateUserInput) {}

@ArgsType()
export class CreateOneUserArgsType extends MutationArgsType(CreateOneUserInput) {}
