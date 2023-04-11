import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { ProductVariantEntity } from "./entities/product-variant.entity";

@QueryService(ProductVariantEntity)
export class ProductVariantService extends TypeOrmQueryService<ProductVariantEntity> {
  constructor(@InjectRepository(ProductVariantEntity) repo: Repository<ProductVariantEntity>) {
    super(repo);
  }

  public findById(id: Id): Promise<ProductVariantEntity> {
    return this.repo.findOne({ where: { id } });
  }

  public findByIdWithProduct(id: Id): Promise<ProductVariantEntity> {
    return this.repo.findOne({ where: { id }, relations: { product: true } });
  }
}
