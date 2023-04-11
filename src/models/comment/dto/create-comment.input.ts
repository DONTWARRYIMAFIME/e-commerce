import { Field, InputType } from "@nestjs/graphql";
import { IsNumber, IsOptional, Max, Min } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { CommentEntity } from "../entities/comment.entity";

@InputType()
export class CreateCommentInput implements Partial<CommentEntity> {
  @IsUUIDI18N()
  @Field()
  userId!: Id;

  @IsUUIDI18N()
  @Field()
  productId!: Id;

  @IsOptional()
  @LengthI18N(1, 8192)
  @Field({ nullable: true })
  description?: string;

  @IsNumber()
  @Min(1.0)
  @Max(5.0)
  rating!: number;
}
