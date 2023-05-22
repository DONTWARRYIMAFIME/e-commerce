import { NestjsQueryGraphQLModule, PagingStrategies } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CartModule } from "../cart/cart.module";
import { DeliveryMethodModule } from "../delivery-method/delivery-method.module";
import { OrderItemModule } from "../order-item/order-item.module";
import { ProductVariantModule } from "../product-variant/product-variant.module";
import { WarehouseItemModule } from "../warehouse-item/warehouse-item.module";
import { CreateOrderInput } from "./dto/create-order.input";
import { UpdateOrderInput } from "./dto/update-order.input";
import { OrderEntity } from "./entities/order.entity";
import { OrderHook } from "./hooks/order.hook";
import { OrderResolver } from "./order.resolver";
import { OrderService } from "./order.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [CartModule, DeliveryMethodModule, WarehouseItemModule, OrderItemModule, ProductVariantModule, NestjsQueryTypeOrmModule.forFeature([OrderEntity])],
      services: [OrderService],
      resolvers: [
        {
          DTOClass: OrderEntity,
          EntityClass: OrderEntity,
          CreateDTOClass: CreateOrderInput,
          UpdateDTOClass: UpdateOrderInput,
          ServiceClass: OrderService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, OrderEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, OrderEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, OrderEntity, OrderHook)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, OrderEntity, OrderHook)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [OrderResolver, OrderService, OrderHook],
  exports: [OrderResolver, OrderService],
})
export class OrderModule {}
