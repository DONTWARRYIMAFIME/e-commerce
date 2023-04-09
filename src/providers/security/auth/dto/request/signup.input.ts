import { InputType, PartialType } from "@nestjs/graphql";
import { LoginInput } from "./login.input";

@InputType()
export class SignupInput extends PartialType(LoginInput) {}
