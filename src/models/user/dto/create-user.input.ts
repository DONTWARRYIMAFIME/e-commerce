import { Field, InputType } from "@nestjs/graphql";
import { Allow } from "class-validator";
import { IsEmailI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { UserEntity } from "../entities/user.entity";

@InputType()
export class CreateUserInput implements Partial<UserEntity> {
  @LengthI18N(2, 64)
  @Field()
  firstName!: string;

  @LengthI18N(2, 128)
  @Field()
  lastName!: string;

  @IsEmailI18N()
  @Field()
  email!: string;

  @Allow()
  //@IsHash("sha512")
  @Field()
  password!: string;
}
