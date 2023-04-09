import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CartItemModule } from "../cart-item/cart-item.module";
import { CartResolver } from "./cart.resolver";
import { CartService } from "./cart.service";
import { CreateCartInput } from "./dto/create-cart.input";
import { UpdateCartInput } from "./dto/update-cart.input";
import { CartEntity } from "./entities/cart.entity";
import { UserCreatedListener } from "./listeners/user-create.listener";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [CartItemModule, NestjsQueryTypeOrmModule.forFeature([CartEntity])],
      services: [CartService],
      resolvers: [
        {
          DTOClass: CartEntity,
          EntityClass: CartEntity,
          CreateDTOClass: CreateCartInput,
          UpdateDTOClass: UpdateCartInput,
          ServiceClass: CartService,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
      ],
    }),
  ],
  providers: [CartResolver, CartService, UserCreatedListener],
  exports: [CartService],
})
export class CartModule {}
