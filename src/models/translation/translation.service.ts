import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { TranslationEntity } from "./entities/translation.entity";

@QueryService(TranslationEntity)
export class TranslationService extends TypeOrmQueryService<TranslationEntity> {
  constructor(@InjectRepository(TranslationEntity) repo: Repository<TranslationEntity>) {
    super(repo);
  }
}
