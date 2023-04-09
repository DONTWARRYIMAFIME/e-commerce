import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { WarehouseItemModule } from "../warehouse-item/warehouse-item.module";
import { CreateWarehouseInput } from "./dto/create-warehouse.input";
import { UpdateWarehouseInput } from "./dto/update-warehouse.input";
import { WarehouseEntity } from "./entities/warehouse.entity";
import { WarehouseResolver } from "./warehouse.resolver";
import { WarehouseService } from "./warehouse.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [WarehouseItemModule, NestjsQueryTypeOrmModule.forFeature([WarehouseEntity])],
      services: [WarehouseService],
      resolvers: [
        {
          DTOClass: WarehouseEntity,
          EntityClass: WarehouseEntity,
          CreateDTOClass: CreateWarehouseInput,
          UpdateDTOClass: UpdateWarehouseInput,
          ServiceClass: WarehouseService,
        },
      ],
    }),
  ],
  providers: [WarehouseResolver, WarehouseService],
  exports: [WarehouseService],
})
export class WarehouseModule {}
