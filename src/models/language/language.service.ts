import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { LanguageEntity } from "./entities/language.entity";

@QueryService(LanguageEntity)
export class LanguageService extends TypeOrmQueryService<LanguageEntity> {
  constructor(@InjectRepository(LanguageEntity) repo: Repository<LanguageEntity>) {
    super(repo);
  }

  public findOneByCode(code: string): Promise<LanguageEntity> {
    return this.repo.findOneBy({ code });
  }
}
