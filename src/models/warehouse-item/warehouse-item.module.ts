import { Module } from "@nestjs/common";
import { NestjsQueryGraphQLModule } from "@ptc-org/nestjs-query-graphql";
import { NestjsQueryTypeOrmModule } from "@ptc-org/nestjs-query-typeorm";
import { ProductVariantModule } from "../product-variant/product-variant.module";
import { CreateWarehouseItemInput } from "./dto/create-warehouse-item.input";
import { UpdateWarehouseItemInput } from "./dto/update-warehouse-item.input";
import { WarehouseItemEntity } from "./entities/warehouse-item.entity";
import { WarehouseItemHook } from "./hooks/warehouse-item.hook";
import { WarehouseItemService } from "./warehouse-item.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [ProductVariantModule, NestjsQueryTypeOrmModule.forFeature([WarehouseItemEntity])],
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
  providers: [WarehouseItemService, WarehouseItemHook],
  exports: [WarehouseItemService, WarehouseItemHook],
})
export class WarehouseItemModule {}
