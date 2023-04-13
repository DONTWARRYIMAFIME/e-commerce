import { UseGuards } from "@nestjs/common";
import { Args, Mutation, Query, Resolver } from "@nestjs/graphql";
import { Id } from "../../common/types/id.type";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CaslUser } from "../../providers/security/casl/decorators/casl-user";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { UserProxy } from "../../providers/security/casl/proxies/user.proxy";
import { CartService } from "./cart.service";
import { DeleteOneCartArgsType } from "./dto/delete-cart.input";
import { UpdateOneCartArgsType } from "./dto/update-cart.input";
import { CartEntity } from "./entities/cart.entity";
import { CartHook } from "./hooks/cart.hook";

@Resolver(() => CartEntity)
export class CartResolver {
  constructor(private readonly cartService: CartService) {}

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.READ, CartEntity)
  @Query(() => CartEntity, { name: "myCart" })
  public findOneCartEntity(@CaslUser() userProxy: UserProxy): Promise<CartEntity> {
    const user = userProxy.getFromRequest();
    return this.cartService.findOneByUserId(user.id);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, CartEntity, CartHook)
  @Mutation(() => CartEntity)
  public async addCartItemsToCart(@Args() input: UpdateOneCartArgsType): Promise<CartEntity> {
    const { id, update } = input.input;
    return this.cartService.addCartItemsToCart(id as Id, update.cartItems);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, CartEntity, CartHook)
  @Mutation(() => CartEntity)
  public async removeCartItemsFromCart(@Args() input: UpdateOneCartArgsType): Promise<CartEntity> {
    const { id, update } = input.input;
    return this.cartService.removeCartItemsFromCart(id as Id, update.cartItems);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, CartEntity, CartHook)
  @Mutation(() => CartEntity)
  public async emptyCart(@Args() input: DeleteOneCartArgsType): Promise<CartEntity> {
    return this.cartService.emptyCart(input.input.id as Id);
  }
}
