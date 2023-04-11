import { Injectable } from "@nestjs/common";
import { SubjectBeforeFilterHook } from "../../../providers/security/casl/interfaces/hooks.interface";
import { AuthorizableRequest } from "../../../providers/security/casl/interfaces/request.interface";
import { CommentService } from "../comment.service";
import { CommentEntity } from "../entities/comment.entity";

@Injectable()
export class CommentHook implements SubjectBeforeFilterHook<Pick<CommentEntity, "id">> {
  constructor(readonly commentService: CommentService) {}

  async run({ params }: AuthorizableRequest) {
    return this.commentService.findById(params.input.id);
  }
}
