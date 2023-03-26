import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { DeepPartial, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { UserEntity } from "./entities/user.entity";

@QueryService(UserEntity)
export class UserService extends TypeOrmQueryService<UserEntity> {
  constructor(@InjectRepository(UserEntity) repo: Repository<UserEntity>) {
    super(repo);
  }

  public findById(id: Id): Promise<UserEntity | undefined> {
    return this.repo.findOne({ where: { id }, relations: { emailAddressEntity: true, roleEntities: true } });
  }

  public findOneByEmail(email: string): Promise<UserEntity> {
    return this.repo.findOne({ relations: { emailAddressEntity: true, roleEntities: true }, where: { emailAddressEntity: { address: email } } });
  }

  public createOne(input: DeepPartial<UserEntity>): Promise<UserEntity> {
    const { email, ...rest } = input;
    return super.createOne({ ...rest, emailAddressEntity: { address: email, name: `${rest.firstName} ${rest.lastName}` } });
  }
}
