import { UseGuards } from "@nestjs/common";
import { Args, Mutation, Query, Resolver } from "@nestjs/graphql";
import { Id } from "../../common/types/id.type";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CaslUser } from "../../providers/security/casl/decorators/casl-user";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { UserProxy } from "../../providers/security/casl/proxies/user.proxy";
import { AddProductsToWishlistArgsType, RemoveProductsFromWishlistArgsType } from "./dto/update-wishlist.input";
import { WishlistEntity } from "./entities/wishlist.entity";
import { WishlistHook } from "./hooks/wishlist.hook";
import { WishlistService } from "./wishlist.service";

@Resolver(() => WishlistEntity)
export class WishlistResolver {
  constructor(readonly service: WishlistService) {}

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.READ, WishlistEntity)
  @Query(() => WishlistEntity, { name: "myWishlist" })
  public findOneWishlist(@CaslUser() userProxy: UserProxy): Promise<WishlistEntity> {
    const user = userProxy.getFromRequest();
    return this.service.findOneByUserId(user.id);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, WishlistEntity, WishlistHook)
  @Mutation(() => WishlistEntity)
  public addProductsToWishlist(@Args() args: AddProductsToWishlistArgsType): Promise<WishlistEntity> {
    const { id, update } = args.input;
    return this.service.addProducts(id as Id, update.products);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, WishlistEntity, WishlistHook)
  @Mutation(() => WishlistEntity)
  public removeProductsFromWishlist(@Args() args: RemoveProductsFromWishlistArgsType): Promise<WishlistEntity> {
    const { id, update } = args.input;
    return this.service.removeProducts(id as Id, update.products);
  }
}
