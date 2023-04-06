import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { AddressEntity } from "./entities/address.entity";

@QueryService(AddressEntity)
export class AddressService extends TypeOrmQueryService<AddressEntity> {
  constructor(@InjectRepository(AddressEntity) repo: Repository<AddressEntity>) {
    super(repo);
  }
}
