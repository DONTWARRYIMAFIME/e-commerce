import { UseGuards } from "@nestjs/common";
import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { FileUpload, GraphQLUpload } from "graphql-upload";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CommentService } from "./comment.service";
import { CreateOneCommentArgsType } from "./dto/create-comment.input";
import { CommentEntity } from "./entities/comment.entity";

@Resolver(() => CommentEntity)
export class CommentResolver {
  constructor(private readonly commentService: CommentService) {}

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.CREATE, CommentEntity)
  @Mutation(() => CommentEntity)
  public async createOneComment(
    @Args() args: CreateOneCommentArgsType,
    @Args("files", { type: () => [GraphQLUpload], defaultValue: [] }) fileUploads: Promise<FileUpload>[],
  ): Promise<CommentEntity> {
    const { input } = args.input;
    const files = await Promise.all(fileUploads);
    return this.commentService.createOne(input, files);
  }
}
