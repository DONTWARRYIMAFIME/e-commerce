import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { DeliveryMethodStatusEntity } from "./entities/delivery-method-status.entity";
import { DeliveryMethodStatus } from "./enums/delivery-method-status.enum";

@Injectable()
export class DeliveryMethodStatusService extends TypeOrmQueryService<DeliveryMethodStatusEntity> {
  constructor(@InjectRepository(DeliveryMethodStatusEntity) repo: Repository<DeliveryMethodStatusEntity>) {
    super(repo);
  }

  public findOneByCode(code: DeliveryMethodStatus, opts?: FindOptionsWhere<DeliveryMethodStatusEntity>): Promise<DeliveryMethodStatusEntity[]> {
    return this.repo.findBy({ code, ...opts });
  }
}
