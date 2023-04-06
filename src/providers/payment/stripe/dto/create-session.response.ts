import { Field } from "@nestjs/graphql";
import { ObjectType } from "../../../../common/decorators";

@ObjectType()
export class CreateSessionResponse {
  @Field()
  url!: string;
}
