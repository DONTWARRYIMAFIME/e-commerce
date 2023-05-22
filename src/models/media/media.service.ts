import { DeleteOneOptions, QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { omit } from "lodash";
import { basename } from "path";
import { FindOptionsWhere, Repository } from "typeorm";
import { extname } from "../../common/helpers/file.helper";
import { Id } from "../../common/types/id.type";
import { CloudinaryService } from "../../providers/storage/cloudinary/cloudinary.service";
import { MediaEntity } from "./entities/media.entity";
import { CreateOneMedia, SaveOneMedia, UpdateOneMedia } from "./type/media.type";

@QueryService(MediaEntity)
export class MediaService extends TypeOrmQueryService<MediaEntity> {
  constructor(@InjectRepository(MediaEntity) repo: Repository<MediaEntity>, private readonly cloudinaryService: CloudinaryService) {
    super(repo);
  }

  public findByIdOrFail(id: Id, opts?: FindOptionsWhere<MediaEntity>): Promise<MediaEntity> {
    return this.repo.findOneByOrFail({ id, ...opts });
  }

  public async createOneMedia(record: CreateOneMedia): Promise<MediaEntity> {
    const { file, path } = record;
    const { public_id: publicId, url, resource_type: format, width, height } = await this.cloudinaryService.uploadFile(file.createReadStream(), extname(file.filename), path);
    return super.createOne({ publicId, filename: basename(publicId), url, format, width, height });
  }

  public async updateOneMedia(record: UpdateOneMedia): Promise<MediaEntity> {
    const { id, file, path } = record;
    const media = await this.findByIdOrFail(id);
    await this.cloudinaryService.removeFile(media.publicId);
    const { public_id: publicId, url, resource_type: format, width, height } = await this.cloudinaryService.uploadFile(file.createReadStream(), extname(file.filename), path);
    return super.updateOne(id, { publicId, filename: basename(publicId), url, format, width, height });
  }

  public async saveOneMedia(record: SaveOneMedia): Promise<MediaEntity> {
    return record.id ? this.updateOneMedia(record as UpdateOneMedia) : this.createOneMedia(omit(record, ["id"]));
  }

  public createManyMedia(records: CreateOneMedia[]): Promise<MediaEntity[]> {
    return Promise.all(records.map(record => this.createOneMedia(record)));
  }

  public updateManyMedia(records: UpdateOneMedia[]): Promise<MediaEntity[]> {
    return Promise.all(records.map(record => this.updateOneMedia(record)));
  }

  public saveManyMedia(records: SaveOneMedia[]): Promise<MediaEntity[]> {
    return Promise.all(records.map(record => this.saveOneMedia(record)));
  }

  public async deleteOneMedia(id: Id, opts?: DeleteOneOptions<MediaEntity>): Promise<MediaEntity> {
    const media = await super.deleteOne(id, opts);
    await this.cloudinaryService.removeFile(media.publicId);
    return media;
  }

  public deleteManyMedia(ids: Id[]): Promise<MediaEntity[]> {
    return Promise.all(ids.map(id => this.deleteOneMedia(id)));
  }
}
