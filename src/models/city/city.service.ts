import { InjectRepository } from "@nestjs/typeorm";
import { QueryService } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { Repository } from "typeorm";
import { CityEntity } from "./entities/city.entity";

@QueryService(CityEntity)
export class CityService extends TypeOrmQueryService<CityEntity> {
  constructor(@InjectRepository(CityEntity) repo: Repository<CityEntity>) {
    super(repo);
  }
}
