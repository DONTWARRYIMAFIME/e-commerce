import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CreateWarehouseItemInput } from "./dto/create-warehouse-item.input";
import { UpdateWarehouseItemInput } from "./dto/update-warehouse-item.input";
import { WarehouseItemEntity } from "./entities/warehouse-item.entity";
import { WarehouseItemService } from "./warehouse-item.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([WarehouseItemEntity])],
      services: [WarehouseItemService],
      resolvers: [
        {
          DTOClass: WarehouseItemEntity,
          EntityClass: WarehouseItemEntity,
          CreateDTOClass: CreateWarehouseItemInput,
          UpdateDTOClass: UpdateWarehouseItemInput,
          ServiceClass: WarehouseItemService,
          read: { disabled: true },
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
      ],
    }),
  ],
  providers: [WarehouseItemService],
  exports: [WarehouseItemService],
})
export class WarehouseItemModule {}
