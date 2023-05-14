import { Field, InputType, OmitType } from "@nestjs/graphql";
import { IsEmailI18N } from "../../../../i18n/i18n.decorators";
import { SignupInput } from "./signup.input";

@InputType()
export class LoginInput extends OmitType(SignupInput, ["email", "passwordConfirmation"]) {
  @IsEmailI18N()
  @Field()
  email!: string;
}
