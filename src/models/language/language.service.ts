import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Language } from "./entities/language.entity";

@QueryService(Language)
export class LanguageService extends TypeOrmQueryService<Language> {
  constructor(@InjectRepository(Language) repo: Repository<Language>) {
    super(repo);
  }

  public findOneByCode(code: string): Promise<Language> {
    return this.repo.findOneBy({ code });
  }
}
