import { FindByIdOptions, QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { UserEntity } from "./entities/user.entity";

@QueryService(UserEntity)
export class UserService extends TypeOrmQueryService<UserEntity> {
  constructor(@InjectRepository(UserEntity) repo: Repository<UserEntity>) {
    super(repo);
  }

  public findById(id: Id, opts?: FindByIdOptions<UserEntity>): Promise<UserEntity | undefined> {
    return this.filterQueryBuilder
      .selectById(id, opts ?? {})
      .leftJoinAndSelect(UserEntity.name + ".emailAddress", "emailAddress")
      .leftJoinAndSelect(UserEntity.name + ".roles", "roles")
      .getOne();
  }

  public findOneByEmail(email: string): Promise<UserEntity> {
    return this.repo.findOne({ relations: { emailAddress: true, roles: true }, where: { emailAddress: { address: email } } });
  }
}
