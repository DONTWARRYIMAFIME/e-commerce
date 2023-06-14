import { InjectRepository } from "@nestjs/typeorm";
import { QueryService } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { FileUpload } from "graphql-upload";
import { map } from "lodash";
import { join } from "path";
import { DeepPartial, FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { PRODUCTS_FOLDER } from "../media/media.constants";
import { MediaService } from "../media/media.service";
import { UserEntity } from "../user/entities/user.entity";
import { ProductEntity } from "./entities/product.entity";

@QueryService(ProductEntity)
export class ProductService extends TypeOrmQueryService<ProductEntity> {
  constructor(@InjectRepository(ProductEntity) repo: Repository<ProductEntity>, private readonly mediaService: MediaService) {
    super(repo);
  }

  public findOneByIdOrFail(id: Id, opts?: FindOptionsWhere<UserEntity>): Promise<ProductEntity> {
    return this.repo.findOneByOrFail({ id, ...opts });
  }

  public async createOne(record: DeepPartial<ProductEntity>, files?: FileUpload[]): Promise<ProductEntity> {
    const product = await super.createOne(record);

    if (files && files.length > 0) {
      return this.addMediaToProduct(product.id, files);
    }

    return product;
  }

  public async addMediaToProduct(id: Id, files: FileUpload[]): Promise<ProductEntity> {
    console.log("called");

    const media = await this.mediaService.createManyMedia(
      files.map(file => {
        return {
          file,
          path: join(PRODUCTS_FOLDER, id),
        };
      }),
    );
    return super.addRelations("media", id, map(media, "id"));
  }

  public async removeMediaFromProduct(id: Id, relationIds: Id[]): Promise<ProductEntity> {
    await this.mediaService.deleteManyMedia(relationIds);
    return this.findOneByIdOrFail(id);
  }
}
