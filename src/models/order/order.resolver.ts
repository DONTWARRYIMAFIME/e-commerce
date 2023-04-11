import { UseGuards } from "@nestjs/common";
import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { Id } from "../../common/types/id.type";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CaslUser } from "../../providers/security/casl/decorators/casl-user";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { UserProxy } from "../../providers/security/casl/proxies/user.proxy";
import { CreateOneOrderFromCurrentUserCartArgsType } from "./dto/create-order.input";
import { CancelOrderArgsType } from "./dto/update-order.input";
import { OrderEntity } from "./entities/order.entity";
import { OrderHook } from "./hooks/order.hook";
import { OrderService } from "./order.service";

@Resolver(() => OrderEntity)
export class OrderResolver {
  constructor(private readonly orderService: OrderService) {}

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.CREATE, OrderEntity)
  @Mutation(() => OrderEntity)
  public createOneOrderFromCurrentUserCart(@Args() args: CreateOneOrderFromCurrentUserCartArgsType, @CaslUser() userProxy: UserProxy): Promise<OrderEntity> {
    const { input } = args.input;
    const user = userProxy.getFromRequest();
    return this.orderService.createOne({ ...input, userId: user.id });
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, OrderEntity, OrderHook)
  @Mutation(() => OrderEntity)
  public cancelOrder(@Args() args: CancelOrderArgsType): Promise<OrderEntity> {
    const { id } = args.input;
    return this.orderService.cancelOrder(id as Id);
  }
}
