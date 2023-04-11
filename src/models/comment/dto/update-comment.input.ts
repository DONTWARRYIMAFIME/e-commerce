import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateCommentInput } from "./create-comment.input";

@InputType()
export class UpdateCommentInput extends OmitType(PartialType(CreateCommentInput), ["userId", "productId"]) {}
