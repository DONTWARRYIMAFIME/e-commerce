import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CartModule } from "../cart/cart.module";
import { DeliveryMethodModule } from "../delivery-method/delivery-method.module";
import { OrderItemModule } from "../order-item/order-item.module";
import { ProductVariantModule } from "../product-variant/product-variant.module";
import { WarehouseItemModule } from "../warehouse-item/warehouse-item.module";
import { CreateOrderInput } from "./dto/create-order.input";
import { UpdateOrderInput } from "./dto/update-order.input";
import { OrderEntity } from "./entities/order.entity";
import { OrderResolver } from "./order.resolver";
import { OrderService } from "./order.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [CartModule, DeliveryMethodModule, WarehouseItemModule, OrderItemModule, ProductVariantModule, NestjsQueryTypeOrmModule.forFeature([OrderEntity])],
      services: [OrderService],
      resolvers: [
        {
          DTOClass: OrderEntity,
          EntityClass: OrderEntity,
          CreateDTOClass: CreateOrderInput,
          UpdateDTOClass: UpdateOrderInput,
          ServiceClass: OrderService,
        },
      ],
    }),
  ],
  providers: [OrderResolver, OrderService],
  exports: [OrderResolver, OrderService],
})
export class OrderModule {}
