import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { DeliveryMethodEntity } from "./entities/delivery-method.entity";
import { DeliveryMethods } from "./enums/delivery-method.enum";

@QueryService(DeliveryMethodEntity)
export class DeliveryMethodService extends TypeOrmQueryService<DeliveryMethodEntity> {
  constructor(@InjectRepository(DeliveryMethodEntity) repo: Repository<DeliveryMethodEntity>) {
    super(repo);
  }

  public findOneById(id: Id, opts?: FindOptionsWhere<DeliveryMethodEntity>): Promise<DeliveryMethodEntity> {
    return this.repo.findOneBy({ id, ...opts });
  }

  public findOneByCode(code: DeliveryMethods, opts?: FindOptionsWhere<DeliveryMethodEntity>): Promise<DeliveryMethodEntity> {
    return this.repo.findOneBy({ code, ...opts });
  }
}
