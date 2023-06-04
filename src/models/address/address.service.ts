import { InjectRepository } from "@nestjs/typeorm";
import { QueryService } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { Repository } from "typeorm";
import { AddressEntity } from "./entities/address.entity";

@QueryService(AddressEntity)
export class AddressService extends TypeOrmQueryService<AddressEntity> {
  constructor(@InjectRepository(AddressEntity) repo: Repository<AddressEntity>) {
    super(repo);
  }
}
