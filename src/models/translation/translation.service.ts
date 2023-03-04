import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Translation } from "./entities/translation.entity";

@QueryService(Translation)
export class TranslationService extends TypeOrmQueryService<Translation> {
  constructor(@InjectRepository(Translation) repo: Repository<Translation>) {
    super(repo);
  }
}
