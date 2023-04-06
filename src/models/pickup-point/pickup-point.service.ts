import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { PickupPointEntity } from "./entities/pickup-point.entity";

@Injectable()
export class PickupPointService extends TypeOrmQueryService<PickupPointEntity> {
  constructor(@InjectRepository(PickupPointEntity) repo: Repository<PickupPointEntity>) {
    super(repo);
  }

  public findOneByCode(code: string, opts?: FindOptionsWhere<PickupPointEntity>): Promise<PickupPointEntity[]> {
    return this.repo.findBy({ code, ...opts });
  }
}
