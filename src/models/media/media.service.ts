import { DeleteOneOptions, QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { basename } from "path";
import { Readable } from "stream";
import { Repository } from "typeorm";
import { extname } from "../../common/helpers/file.helper";
import { Id } from "../../common/types/id.type";
import { CloudinaryService } from "../../providers/storage/cloudinary/cloudinary.service";
import { MediaEntity } from "./entities/media.entity";

@QueryService(MediaEntity)
export class MediaService extends TypeOrmQueryService<MediaEntity> {
  constructor(@InjectRepository(MediaEntity) repo: Repository<MediaEntity>, private readonly cloudinaryService: CloudinaryService) {
    super(repo);
  }

  public async saveMedia(stream: Readable, filename: string, path?: string, media?: MediaEntity): Promise<MediaEntity> {
    // Uploading new file
    const { public_id: publicId, url, resource_type: format } = await this.cloudinaryService.uploadFile(stream, extname(filename), path);

    // For update, we have to remove file from server. It is only possible to make an update on MediaEntity instance
    if (media) {
      await this.cloudinaryService.removeFile(media.publicId);
      return super.updateOne(media.id, { publicId, filename: basename(publicId), url, format });
    }

    return super.createOne({ publicId, filename: basename(publicId), url, format });
  }

  public async deleteOne(id: Id, opts?: DeleteOneOptions<MediaEntity>): Promise<MediaEntity> {
    const media = await super.deleteOne(id, opts);
    await this.cloudinaryService.removeFile(media.publicId);
    return media;
  }
}
