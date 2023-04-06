import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { WishlistEntity } from "./entities/wishlist.entity";

@Injectable()
export class WishlistService extends TypeOrmQueryService<WishlistEntity> {
  constructor(@InjectRepository(WishlistEntity) repo: Repository<WishlistEntity>) {
    super(repo);
  }

  public findOneByUserId(userId: Id, opts?: FindOptionsWhere<WishlistEntity>): Promise<WishlistEntity> {
    return this.repo.findOneBy({ userId, ...opts });
  }
}
