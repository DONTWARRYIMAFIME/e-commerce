import { MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { MediaEntity } from "../entities/media.entity";

@InputType()
export class SelectMediaInput implements Pick<MediaEntity, "id"> {
  @IsUUIDI18N()
  @Field()
  id!: Id;
}

@ArgsType()
export class SelectMediaArgsType extends MutationArgsType(SelectMediaInput) {}
