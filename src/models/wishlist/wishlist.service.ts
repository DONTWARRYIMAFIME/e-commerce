import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { map } from "lodash";
import { FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { ProductEntity } from "../product/entities/product.entity";
import { WishlistEntity } from "./entities/wishlist.entity";

@Injectable()
export class WishlistService extends TypeOrmQueryService<WishlistEntity> {
  constructor(@InjectRepository(WishlistEntity) repo: Repository<WishlistEntity>) {
    super(repo);
  }

  public findById(id: Id): Promise<WishlistEntity> {
    return this.repo.findOneBy({ id });
  }

  public findOneByUserId(userId: Id, opts?: FindOptionsWhere<WishlistEntity>): Promise<WishlistEntity> {
    return this.repo.findOneBy({ userId, ...opts });
  }

  public addProducts(id: Id, products: Pick<ProductEntity, "id">[]): Promise<WishlistEntity> {
    const relationIds = map(products, "id");
    return super.addRelations("products", id, relationIds);
  }

  public removeProducts(id: Id, products: Pick<ProductEntity, "id">[]): Promise<WishlistEntity> {
    const relationIds = map(products, "id");
    return super.removeRelations("products", id, relationIds);
  }
}
