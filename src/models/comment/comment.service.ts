import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { FileUpload } from "graphql-upload";
import { map } from "lodash";
import { join } from "path";
import { DeepPartial, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { COMMENTS_FOLDER } from "../media/media.constants";
import { MediaService } from "../media/media.service";
import { CommentEntity } from "./entities/comment.entity";

@QueryService(CommentEntity)
export class CommentService extends TypeOrmQueryService<CommentEntity> {
  constructor(@InjectRepository(CommentEntity) repo: Repository<CommentEntity>, private readonly mediaService: MediaService) {
    super(repo);
  }

  public findById(id: Id): Promise<CommentEntity> {
    return this.repo.findOneBy({ id });
  }

  public async createOne(record: DeepPartial<CommentEntity>, files?: FileUpload[]): Promise<CommentEntity> {
    const comment = await super.createOne(record);

    if (files && files.length > 0) {
      return this.addMediaToComment(comment.id, files);
    }

    return comment;
  }

  public async addMediaToComment(id: Id, files: FileUpload[]): Promise<CommentEntity> {
    const media = await this.mediaService.createManyMedia(
      files.map(file => {
        return {
          file,
          path: join(COMMENTS_FOLDER, id),
        };
      }),
    );
    return super.addRelations("media", id, map(media, "id"));
  }
}
