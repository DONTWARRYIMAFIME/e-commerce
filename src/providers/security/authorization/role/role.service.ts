import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { FindOptionsWhere, In, Repository } from "typeorm";
import { RoleEntity } from "./entities/role.entity";
import { Roles } from "./role.enum";

@QueryService(RoleEntity)
export class RoleService extends TypeOrmQueryService<RoleEntity> {
  constructor(@InjectRepository(RoleEntity) repo: Repository<RoleEntity>) {
    super(repo);
  }

  public async findOneByName(name: Roles): Promise<RoleEntity> {
    return this.repo.findOneBy({ name });
  }

  public get customerRole(): Promise<RoleEntity> {
    return this.repo.findOneBy({ name: Roles.CUSTOMER });
  }

  public async findManyByNames(names: Roles[], opts?: FindOptionsWhere<RoleEntity>): Promise<RoleEntity[]> {
    return this.repo.findBy({ name: In(names), ...opts });
  }
}
