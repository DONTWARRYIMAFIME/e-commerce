import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { UserAddressEntity } from "./entities/user-address.entity";

@QueryService(UserAddressEntity)
export class UserAddressService extends TypeOrmQueryService<UserAddressEntity> {
  constructor(@InjectRepository(UserAddressEntity) repo: Repository<UserAddressEntity>) {
    super(repo);
  }

  public findById(id: Id): Promise<UserAddressEntity> {
    return this.repo.findOneBy({ id });
  }
}
