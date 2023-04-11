import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CartItemModule } from "../cart-item/cart-item.module";
import { CartResolver } from "./cart.resolver";
import { CartService } from "./cart.service";
import { CreateCartInput } from "./dto/create-cart.input";
import { UpdateCartInput } from "./dto/update-cart.input";
import { CartEntity } from "./entities/cart.entity";
import { CartHook } from "./hooks/cart.hook";
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
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, CartEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, CartEntity)],
            disabled: true,
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, CartEntity, CartHook)],
            disabled: true,
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, CartEntity, CartHook)],
            disabled: true,
          },
        },
      ],
    }),
  ],
  providers: [CartResolver, CartService, UserCreatedListener, CartHook],
  exports: [CartService],
})
export class CartModule {}
