import { Module } from "@nestjs/common";
import { NestjsQueryGraphQLModule, PagingStrategies } from "@ptc-org/nestjs-query-graphql";
import { NestjsQueryTypeOrmModule } from "@ptc-org/nestjs-query-typeorm";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { PriceModule } from "../price/price.module";
import { ProductVariantModule } from "../product-variant/product-variant.module";
import { WarehouseItemModule } from "../warehouse-item/warehouse-item.module";
import { CartItemService } from "./cart-item.service";
import { CreateCartItemInput } from "./dto/create-cart-item.input";
import { UpdateCartItemInput } from "./dto/update-cart-item.input";
import { CartItemEntity } from "./entities/cart-item.entity";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [WarehouseItemModule, ProductVariantModule, PriceModule, NestjsQueryTypeOrmModule.forFeature([CartItemEntity])],
      services: [CartItemService],
      resolvers: [
        {
          DTOClass: CartItemEntity,
          EntityClass: CartItemEntity,
          CreateDTOClass: CreateCartItemInput,
          UpdateDTOClass: UpdateCartItemInput,
          ServiceClass: CartItemService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, CartItemEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, CartItemEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, CartItemEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, CartItemEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [CartItemService],
  exports: [CartItemService],
})
export class CartItemModule {}
