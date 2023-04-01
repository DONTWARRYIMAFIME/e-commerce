import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { ColorEntity } from "./entities/color.entity";

@QueryService(ColorEntity)
export class ColorService extends TypeOrmQueryService<ColorEntity> {
  constructor(@InjectRepository(ColorEntity) repo: Repository<ColorEntity>) {
    super(repo);
  }

  public findOneByCode(code: string, opts?: FindOptionsWhere<ColorEntity>): Promise<ColorEntity> {
    return this.repo.findOneBy({ code, ...opts });
  }
}
