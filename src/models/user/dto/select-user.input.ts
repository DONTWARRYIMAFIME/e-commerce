import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { MutationArgsType } from "@ptc-org/nestjs-query-graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { UserEntity } from "../entities/user.entity";

@InputType()
export class SelectUserInput implements Pick<UserEntity, "id"> {
  @IsUUIDI18N()
  @Field()
  id!: Id;
}

@ArgsType()
export class SelectUserArgsType extends MutationArgsType(SelectUserInput) {}
