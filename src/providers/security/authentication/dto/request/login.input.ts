import { InputType, PartialType } from "@nestjs/graphql";
import { CreateUserInput } from "../../../../../models/user/dto/create-user.input";

@InputType()
export class LoginInput extends PartialType(CreateUserInput) {}
