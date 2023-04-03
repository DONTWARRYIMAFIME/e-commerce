import { Args, Mutation, Query, Resolver } from "@nestjs/graphql";
import { CaslUser, UserProxy } from "nest-casl";
import { Id } from "../../common/types/id.type";
import { UpdateOneCartItemArgsType } from "../cart-item/dto/update-cart-item.input";
import { CartService } from "./cart.service";
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
  public async addCartItemToCart(@Args() { input }: UpdateOneCartItemArgsType): Promise<CartEntity> {
    const { id, update } = input;
    return this.cartService.addCartItemToCart(id as Id, update);
  }

  @Mutation(() => CartEntity)
  public async removeCartItemFromCart(@Args() { input }: UpdateOneCartItemArgsType): Promise<CartEntity> {
    const { id, update } = input;
    return this.cartService.removeCartItemFromCart(id as Id, update);
  }
}
