import { InputType, PartialType } from "@nestjs/graphql";
import { CreateUserInput } from "../../../../../models/user/dto/create-user.input";

@InputType()
export class SignupInput extends PartialType(CreateUserInput) {}
