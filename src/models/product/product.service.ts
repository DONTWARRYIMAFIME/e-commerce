import { InjectRepository } from "@nestjs/typeorm";
import { Query, QueryOptions, QueryService } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { FileUpload } from "graphql-upload";
import { map } from "lodash";
import { join } from "path";
import { DeepPartial, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { PRODUCTS_FOLDER } from "../media/media.constants";
import { MediaService } from "../media/media.service";
import { ProductEntity } from "./entities/product.entity";

@QueryService(ProductEntity)
export class ProductService extends TypeOrmQueryService<ProductEntity> {
  constructor(@InjectRepository(ProductEntity) repo: Repository<ProductEntity>, private readonly mediaService: MediaService) {
    super(repo);
  }

  public findById(id: Id): Promise<ProductEntity> {
    return this.repo.findOne({ where: { id }, relations: { productVariants: { color: true, size: true } } });
  }

  public findOneByIdOrFail(id: Id): Promise<ProductEntity> {
    return this.repo.findOneOrFail({ where: { id }, relations: { productVariants: { color: true, size: true } } });
  }

  public async createOne(record: DeepPartial<ProductEntity>, files?: FileUpload[]): Promise<ProductEntity> {
    const product = await super.createOne(record);

    if (files && files.length > 0) {
      return this.addMediaToProduct(product.id, files);
    }

    return product;
  }

  public async addMediaToProduct(id: Id, files: FileUpload[]): Promise<ProductEntity> {
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

  public query(query: Query<ProductEntity>, opts?: QueryOptions): Promise<ProductEntity[]> {
    // To hide lib bug using relations + offset pagination strategy. Query should use skip/take instead of limit/offset
    const correction = 10;
    return super.query(
      {
        relations: [
          {
            name: "productVariants",
            query: {
              relations: [
                { name: "color", query: {} },
                { name: "size", query: {} },
              ],
            },
          },
        ],
        ...(Boolean(query.paging) && { paging: { offset: query.paging.offset * correction, limit: query.paging.limit * correction } }),
        ...(Boolean(query.sorting) && { sorting: query.sorting }),
        ...(Boolean(query.filter) && { filter: query.filter }),
      },
      opts,
    );
  }
}
