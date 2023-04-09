import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { CaslUser, UserProxy } from "nest-casl";
import { CreateOneOrderFromCurrentUserCartArgsType } from "./dto/create-order.input";
import { OrderEntity } from "./entities/order.entity";
import { OrderService } from "./order.service";

@Resolver(() => OrderEntity)
export class OrderResolver {
  constructor(private readonly orderService: OrderService) {}

  @Mutation(() => OrderEntity)
  public createOneOrderFromCurrentUserCart(@Args() args: CreateOneOrderFromCurrentUserCartArgsType, @CaslUser() userProxy: UserProxy): Promise<OrderEntity> {
    const { input } = args.input;
    const user = userProxy.getFromRequest();
    return this.orderService.createOne({ ...input, userId: user.id });
  }
}
