import { Module } from "@nestjs/common";
import { SortDirection } from "@ptc-org/nestjs-query-core";
import { NestjsQueryGraphQLModule, PagingStrategies } from "@ptc-org/nestjs-query-graphql";
import { NestjsQueryTypeOrmModule } from "@ptc-org/nestjs-query-typeorm";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { MediaModule } from "../media/media.module";
import { CommentResolver } from "./comment.resolver";
import { CommentService } from "./comment.service";
import { CreateCommentInput } from "./dto/create-comment.input";
import { UpdateCommentInput } from "./dto/update-comment.input";
import { CommentEntity } from "./entities/comment.entity";
import { CommentHook } from "./hooks/comment.hook";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [MediaModule, NestjsQueryTypeOrmModule.forFeature([CommentEntity])],
      services: [CommentService],
      resolvers: [
        {
          DTOClass: CommentEntity,
          EntityClass: CommentEntity,
          CreateDTOClass: CreateCommentInput,
          UpdateDTOClass: UpdateCommentInput,
          ServiceClass: CommentService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, CommentEntity)],
            defaultSort: [{ field: "createdAt", direction: SortDirection.DESC }],
          },
          create: {
            disabled: true,
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, CommentEntity, CommentHook)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, CommentEntity, CommentHook)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [CommentService, CommentResolver, CommentHook],
  exports: [CommentService],
})
export class CommentModule {}
