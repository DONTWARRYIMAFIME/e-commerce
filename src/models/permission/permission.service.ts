import { InjectRepository } from "@nestjs/typeorm";
import { QueryService } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { Repository } from "typeorm";
import { PermissionEntity } from "./entities/permission.entity";

@QueryService(PermissionEntity)
export class PermissionService extends TypeOrmQueryService<PermissionEntity> {
  constructor(@InjectRepository(PermissionEntity) repo: Repository<PermissionEntity>) {
    super(repo);
  }
}
