import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { UserAddressEntity } from "./entities/user-address.entity";

@QueryService(UserAddressEntity)
export class UserAddressService extends TypeOrmQueryService<UserAddressEntity> {
  constructor(@InjectRepository(UserAddressEntity) repo: Repository<UserAddressEntity>) {
    super(repo);
  }
}
