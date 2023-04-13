import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PermissionEntity } from "./entities/permission.entity";

@QueryService(PermissionEntity)
export class PermissionService extends TypeOrmQueryService<PermissionEntity> {
  constructor(@InjectRepository(PermissionEntity) repo: Repository<PermissionEntity>) {
    super(repo);
  }
}
