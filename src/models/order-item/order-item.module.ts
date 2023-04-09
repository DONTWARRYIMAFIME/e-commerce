import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { WarehouseItemModule } from "../warehouse-item/warehouse-item.module";
import { WarehouseModule } from "../warehouse/warehouse.module";
import { CreateOrderItemInput } from "./dto/create-order-item.input";
import { UpdateOrderItemInput } from "./dto/update-order-item.input";
import { OrderItemEntity } from "./entities/order-item.entity";
import { OrderItemService } from "./order-item.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [WarehouseModule, WarehouseItemModule, NestjsQueryTypeOrmModule.forFeature([OrderItemEntity])],
      services: [OrderItemService],
      resolvers: [
        {
          DTOClass: OrderItemEntity,
          EntityClass: OrderItemEntity,
          CreateDTOClass: CreateOrderItemInput,
          UpdateDTOClass: UpdateOrderItemInput,
          ServiceClass: OrderItemService,
        },
      ],
    }),
  ],
  providers: [OrderItemService],
  exports: [OrderItemService],
})
export class OrderItemModule {}
