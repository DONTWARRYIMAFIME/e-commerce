import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { BrandEntity } from "./entities/brand.entity";

@QueryService(BrandEntity)
export class BrandService extends TypeOrmQueryService<BrandEntity> {
  constructor(@InjectRepository(BrandEntity) repo: Repository<BrandEntity>) {
    super(repo);
  }

  public findOneByCode(code: string, opts?: FindOptionsWhere<BrandEntity>): Promise<BrandEntity> {
    return this.repo.findOneBy({ code, ...opts });
  }
}
