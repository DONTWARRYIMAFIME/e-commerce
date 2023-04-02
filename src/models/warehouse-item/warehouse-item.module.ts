import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { WarehouseItemEntity } from "./entities/warehouse-item.entity";
import { WarehouseItemService } from "./warehouse-item.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([WarehouseItemEntity])],
      services: [WarehouseItemService],
    }),
  ],
  providers: [WarehouseItemService],
  exports: [WarehouseItemService],
})
export class WarehouseItemModule {}
