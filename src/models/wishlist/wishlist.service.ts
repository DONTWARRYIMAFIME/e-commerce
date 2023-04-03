import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { map } from "lodash";
import { FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { ProductVariantEntity } from "../product-variant/entities/product-variant.entity";
import { WishlistEntity } from "./entities/wishlist.entity";

@Injectable()
export class WishlistService extends TypeOrmQueryService<WishlistEntity> {
  constructor(@InjectRepository(WishlistEntity) repo: Repository<WishlistEntity>) {
    super(repo);
  }

  public findOneByUserId(userId: Id, opts?: FindOptionsWhere<WishlistEntity>): Promise<WishlistEntity> {
    return this.repo.findOneBy({ userId, ...opts });
  }

  public addProductVariants(id: Id, productVariants: Pick<ProductVariantEntity, "id">[]): Promise<WishlistEntity> {
    return super.addRelations<ProductVariantEntity>("productVariants", id, map(productVariants, "id"));
  }

  public setProductVariants(id: Id, productVariants: Pick<ProductVariantEntity, "id">[]): Promise<WishlistEntity> {
    return super.setRelations<ProductVariantEntity>("productVariants", id, map(productVariants, "id"));
  }

  public removeProductVariants(id: Id, productVariants: Pick<ProductVariantEntity, "id">[]): Promise<WishlistEntity> {
    return super.removeRelations<ProductVariantEntity>("productVariants", id, map(productVariants, "id"));
  }
}
