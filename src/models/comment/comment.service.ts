import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { CommentEntity } from "./entities/comment.entity";

@QueryService(CommentEntity)
export class CommentService extends TypeOrmQueryService<CommentEntity> {
  constructor(@InjectRepository(CommentEntity) repo: Repository<CommentEntity>) {
    super(repo);
  }

  public findById(id: Id): Promise<CommentEntity> {
    return this.repo.findOneBy({ id });
  }
}
