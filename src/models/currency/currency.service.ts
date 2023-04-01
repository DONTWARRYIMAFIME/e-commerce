import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { CurrencyEntity } from "./entities/currency.entity";
import { Currency } from "./enum/currency.enum";

@QueryService(CurrencyEntity)
export class CurrencyService extends TypeOrmQueryService<CurrencyEntity> {
  constructor(@InjectRepository(CurrencyEntity) repo: Repository<CurrencyEntity>) {
    super(repo);
  }

  public findOneByCode(code: Currency, opts?: FindOptionsWhere<CurrencyEntity>): Promise<CurrencyEntity> {
    return this.repo.findOneBy({ code, ...opts });
  }

  public get defaultCurrency(): Promise<CurrencyEntity> {
    return this.findOneByCode(Currency.USD);
  }
}
