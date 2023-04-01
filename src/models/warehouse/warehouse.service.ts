import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { WarehouseEntity } from "./entities/warehouse.entity";

@Injectable()
export class WarehouseService extends TypeOrmQueryService<WarehouseEntity> {
  constructor(@InjectRepository(WarehouseEntity) repo: Repository<WarehouseEntity>) {
    super(repo);
  }
}
