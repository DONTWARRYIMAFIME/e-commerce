import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { FindOptionsWhere, TreeRepository } from "typeorm";
import { CategoryEntity } from "./entities/category.entity";
import { Categories } from "./enums/category.enum";

@Injectable()
export class CategoryService extends TypeOrmQueryService<CategoryEntity> {
  constructor(@InjectRepository(CategoryEntity) readonly repo: TreeRepository<CategoryEntity>) {
    super(repo);
  }

  public findOneByCode(code: Categories, opts?: FindOptionsWhere<CategoryEntity>): Promise<CategoryEntity> {
    return this.repo.findOneBy({ code, ...opts });
  }
}
