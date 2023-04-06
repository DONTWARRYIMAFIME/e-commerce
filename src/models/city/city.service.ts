import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { CityEntity } from "./entities/city.entity";

@QueryService(CityEntity)
export class CityService extends TypeOrmQueryService<CityEntity> {
  constructor(@InjectRepository(CityEntity) repo: Repository<CityEntity>) {
    super(repo);
  }
}
