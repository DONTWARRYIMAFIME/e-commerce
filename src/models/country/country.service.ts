import { InjectRepository } from "@nestjs/typeorm";
import { QueryService } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { CountryEntity } from "./entities/country.entity";
import { Country } from "./enums/country.enum";

@QueryService(CountryEntity)
export class CountryService extends TypeOrmQueryService<CountryEntity> {
  constructor(@InjectRepository(CountryEntity) repo: Repository<CountryEntity>) {
    super(repo);
  }

  public async findOneByCode(code: Country, opts?: FindOptionsWhere<CountryEntity>): Promise<CountryEntity> {
    return this.repo.findOneBy({ code, ...opts });
  }
}
