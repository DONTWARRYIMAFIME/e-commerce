import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PromotionEntity } from "./entities/promotion.entity";

@QueryService(PromotionEntity)
export class PromotionService extends TypeOrmQueryService<PromotionEntity> {
  constructor(@InjectRepository(PromotionEntity) repo: Repository<PromotionEntity>) {
    super(repo);
  }
}
