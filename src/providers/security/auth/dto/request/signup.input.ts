import { Field, InputType, PartialType } from "@nestjs/graphql";
import { IsEqualToI18N } from "../../../../i18n/i18n.decorators";
import { LoginInput } from "./login.input";

@InputType()
export class SignupInput extends PartialType(LoginInput) {
  @IsEqualToI18N<SignupInput>("password")
  @Field()
  passwordConfirmation!: string;
}
