import { Field, InputType } from "@nestjs/graphql";
import { Allow, IsEmail } from "class-validator";
import { User } from "../entities/user.entity";

@InputType()
export class CreateUserInput implements Partial<User> {
  @IsEmail()
  @Field()
  email!: string;

  @Allow()
  //@IsHash("sha512")
  @Field()
  password!: string;
}
