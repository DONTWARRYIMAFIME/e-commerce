import { Field, InputType } from "@nestjs/graphql";
import { Allow } from "class-validator";
import { IsEmailI18N } from "../../../i18n/i18n.decorators";
import { User } from "../entities/user.entity";

@InputType()
export class CreateUserInput implements Partial<User> {
  @IsEmailI18N()
  @Field()
  email!: string;

  @Allow()
  //@IsHash("sha512")
  @Field()
  password!: string;
}
