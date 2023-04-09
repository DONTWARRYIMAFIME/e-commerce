import { Args, Mutation, Query, Resolver } from "@nestjs/graphql";
import { Id } from "../../common/types/id.type";
import { CaslUser } from "../../providers/security/casl/decorators/casl-user";
import { UserProxy } from "../../providers/security/casl/proxies/user.proxy";
import { CartService } from "./cart.service";
import { DeleteOneCartArgsType } from "./dto/delete-cart.input";
import { UpdateOneCartArgsType } from "./dto/update-cart.input";
import { CartEntity } from "./entities/cart.entity";

@Resolver(() => CartEntity)
export class CartResolver {
  constructor(private readonly cartService: CartService) {}

  @Query(() => CartEntity, { name: "myCart" })
  public findOneCartEntity(@CaslUser() userProxy: UserProxy): Promise<CartEntity> {
    const user = userProxy.getFromRequest();
    return this.cartService.findOneByUserId(user.id);
  }

  @Mutation(() => CartEntity)
  public async addCartItemsToCart(@Args() input: UpdateOneCartArgsType): Promise<CartEntity> {
    const { id, update } = input.input;
    return this.cartService.addCartItemsToCart(id as Id, update.cartItems);
  }

  @Mutation(() => CartEntity)
  public async removeCartItemsFromCart(@Args() input: UpdateOneCartArgsType): Promise<CartEntity> {
    const { id, update } = input.input;
    return this.cartService.removeCartItemsFromCart(id as Id, update.cartItems);
  }

  @Mutation(() => CartEntity)
  public async emptyCart(@Args() input: DeleteOneCartArgsType): Promise<CartEntity> {
    return this.cartService.emptyCart(input.input.id as Id);
  }
}
