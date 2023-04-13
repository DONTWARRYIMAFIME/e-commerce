import { Field, ObjectType } from "@nestjs/graphql";
import { UserEntity } from "../../../../../models/user/entities/user.entity";

@ObjectType()
export class LoginResponse {
  @Field()
  accessToken!: string;

  @Field()
  refreshToken!: string;

  @Field()
  user!: UserEntity;
}
