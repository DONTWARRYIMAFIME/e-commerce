import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { DeepPartial, Repository } from "typeorm";
import { ProductEntity } from "./entities/product.entity";

@QueryService(ProductEntity)
export class ProductVariantService extends TypeOrmQueryService<ProductEntity> {
  constructor(@InjectRepository(ProductEntity) repo: Repository<ProductEntity>) {
    super(repo);
  }

  public createOne(record: DeepPartial<ProductEntity>): Promise<ProductEntity> {
    console.log(record);
    return super.createOne(record);
  }
}
