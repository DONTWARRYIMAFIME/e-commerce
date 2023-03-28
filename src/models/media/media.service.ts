import { DeleteOneOptions, QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { FileUpload } from "graphql-upload";
import { basename } from "path";
import { Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { CloudinaryService } from "../../providers/storage/cloudinary/cloudinary.service";
import { MediaEntity } from "./entities/media.entity";

@QueryService(MediaEntity)
export class MediaService extends TypeOrmQueryService<MediaEntity> {
  constructor(@InjectRepository(MediaEntity) repo: Repository<MediaEntity>, private readonly cloudinaryService: CloudinaryService) {
    super(repo);
  }

  public async createMedia(file: FileUpload, path?: string): Promise<MediaEntity> {
    const { public_id: secureId, url, resource_type: format } = await this.cloudinaryService.uploadFile(file.createReadStream(), file.filename, path);
    return super.createOne({ secureId, filename: basename(secureId), url, format });
  }

  public async deleteOne(id: Id, opts?: DeleteOneOptions<MediaEntity>): Promise<MediaEntity> {
    const media = await super.deleteOne(id, opts);
    await this.cloudinaryService.removeFile(media.secureId);
    return media;
  }
}
