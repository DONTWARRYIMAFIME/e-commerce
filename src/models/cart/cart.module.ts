import { Module } from "@nestjs/common";
import { NestjsQueryGraphQLModule, PagingStrategies } from "@ptc-org/nestjs-query-graphql";
import { NestjsQueryTypeOrmModule } from "@ptc-org/nestjs-query-typeorm";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CartItemModule } from "../cart-item/cart-item.module";
import { DeliveryMethodModule } from "../delivery-method/delivery-method.module";
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
      imports: [CartItemModule, DeliveryMethodModule, NestjsQueryTypeOrmModule.forFeature([CartEntity])],
      services: [CartService],
      resolvers: [
        {
          DTOClass: CartEntity,
          EntityClass: CartEntity,
          CreateDTOClass: CreateCartInput,
          UpdateDTOClass: UpdateCartInput,
          ServiceClass: CartService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, CartEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, CartEntity)],
            // TODO: SET DISABLED
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, CartEntity, CartHook)],
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
