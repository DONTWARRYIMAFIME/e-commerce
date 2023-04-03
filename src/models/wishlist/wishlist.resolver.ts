import { Args, Mutation, Query, Resolver } from "@nestjs/graphql";
import { CaslUser, UserProxy } from "nest-casl";
import { Id } from "../../common/types/id.type";
import { UpdateOneWishlistArgsType } from "./dto/update-wishlist.input";
import { WishlistEntity } from "./entities/wishlist.entity";
import { WishlistService } from "./wishlist.service";

@Resolver(() => WishlistEntity)
export class WishlistResolver {
  constructor(readonly service: WishlistService) {}

  @Query(() => WishlistEntity, { name: "myWishlist" })
  public findOneWishlist(@CaslUser() userProxy: UserProxy): Promise<WishlistEntity> {
    const user = userProxy.getFromRequest();
    return this.service.findOneByUserId(user.id);
  }

  @Mutation(() => WishlistEntity)
  public addProductVariantsToWishlist(@Args() input: UpdateOneWishlistArgsType): Promise<WishlistEntity> {
    const { id, update } = input.input;
    return this.service.addProductVariants(id as Id, update.productVariants);
  }

  @Mutation(() => WishlistEntity)
  public setProductVariantsToWishlist(@Args() input: UpdateOneWishlistArgsType): Promise<WishlistEntity> {
    const { id, update } = input.input;
    return this.service.setProductVariants(id as Id, update.productVariants);
  }

  @Mutation(() => WishlistEntity)
  public removeProductVariantsFromWishlist(@Args() input: UpdateOneWishlistArgsType): Promise<WishlistEntity> {
    const { id, update } = input.input;
    return this.service.removeProductVariants(id as Id, update.productVariants);
  }
}
