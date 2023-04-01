import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { ProductVariantEntity } from "./entities/product-variant.entity";

@QueryService(ProductVariantEntity)
export class ProductVariantService extends TypeOrmQueryService<ProductVariantEntity> {
  constructor(@InjectRepository(ProductVariantEntity) repo: Repository<ProductVariantEntity>) {
    super(repo);
  }
}
