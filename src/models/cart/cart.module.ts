import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CartItemModule } from "../cart-item/cart-item.module";
import { PriceModule } from "../price/price.module";
import { CartResolver } from "./cart.resolver";
import { CartService } from "./cart.service";
import { CreateCartInput } from "./dto/create-cart.input";
import { UpdateCartInput } from "./dto/update-cart.input";
import { CartEntity } from "./entities/cart.entity";
import { UserCreatedListener } from "./listeners/user-create.listener";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [CartItemModule, PriceModule, NestjsQueryTypeOrmModule.forFeature([CartEntity])],
      services: [CartService],
      resolvers: [
        {
          DTOClass: CartEntity,
          EntityClass: CartEntity,
          CreateDTOClass: CreateCartInput,
          UpdateDTOClass: UpdateCartInput,
          ServiceClass: CartService,
        },
      ],
    }),
  ],
  providers: [CartResolver, CartService, UserCreatedListener],
  exports: [CartService],
})
export class CartModule {}
