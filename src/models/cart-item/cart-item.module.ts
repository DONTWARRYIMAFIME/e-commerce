import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
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
          read: { disabled: true },
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
      ],
    }),
  ],
  providers: [CartItemService],
  exports: [CartItemService],
})
export class CartItemModule {}
