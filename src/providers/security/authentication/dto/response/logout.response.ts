import { Field, ObjectType } from "@nestjs/graphql";

@ObjectType()
export class LogoutResponse {
  @Field()
  status!: string;
}
