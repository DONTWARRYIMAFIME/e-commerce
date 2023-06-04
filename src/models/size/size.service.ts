import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { SizeEntity } from "./entities/size.entity";
import { Sizes } from "./enums/size.enum";

@Injectable()
export class SizeService extends TypeOrmQueryService<SizeEntity> {
  constructor(@InjectRepository(SizeEntity) repo: Repository<SizeEntity>) {
    super(repo);
  }

  public findOneByCode(code: Sizes, opts?: FindOptionsWhere<SizeEntity>): Promise<SizeEntity> {
    return this.repo.findOneBy({ code, ...opts });
  }
}
