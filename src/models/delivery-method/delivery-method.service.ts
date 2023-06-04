import { InjectRepository } from "@nestjs/typeorm";
import { QueryService } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
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
