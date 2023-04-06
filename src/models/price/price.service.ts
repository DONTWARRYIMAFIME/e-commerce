import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { omit } from "lodash";
import { DeepPartial, Repository } from "typeorm";
import { PriceEntity } from "./entities/price.entity";

@QueryService(PriceEntity)
export class PriceService extends TypeOrmQueryService<PriceEntity> {
  constructor(@InjectRepository(PriceEntity) repo: Repository<PriceEntity>) {
    super(repo);
  }

  public saveOne(record: DeepPartial<PriceEntity>): Promise<PriceEntity> {
    return record.id ? super.updateOne(record.id, omit(record, "id")) : super.createOne(record);
  }
}
