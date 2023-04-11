import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { WarehouseItemModule } from "../warehouse-item/warehouse-item.module";
import { WarehouseModule } from "../warehouse/warehouse.module";
import { CreateOrderItemInput } from "./dto/create-order-item.input";
import { UpdateOrderItemInput } from "./dto/update-order-item.input";
import { OrderItemEntity } from "./entities/order-item.entity";
import { OrderItemService } from "./order-item.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [WarehouseModule, WarehouseItemModule, NestjsQueryTypeOrmModule.forFeature([OrderItemEntity])],
      services: [OrderItemService],
      resolvers: [
        {
          DTOClass: OrderItemEntity,
          EntityClass: OrderItemEntity,
          CreateDTOClass: CreateOrderItemInput,
          UpdateDTOClass: UpdateOrderItemInput,
          ServiceClass: OrderItemService,
          read: { disabled: true },
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
      ],
    }),
  ],
  providers: [OrderItemService],
  exports: [OrderItemService],
})
export class OrderItemModule {}
