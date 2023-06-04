import { InjectRepository } from "@nestjs/typeorm";
import { QueryService } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { Repository } from "typeorm";
import { PromotionEntity } from "./entities/promotion.entity";

@QueryService(PromotionEntity)
export class PromotionService extends TypeOrmQueryService<PromotionEntity> {
  constructor(@InjectRepository(PromotionEntity) repo: Repository<PromotionEntity>) {
    super(repo);
  }
}
