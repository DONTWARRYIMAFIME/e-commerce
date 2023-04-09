import { Query, Resolver } from "@nestjs/graphql";
import { CaslUser } from "../../providers/security/casl/decorators/casl-user";
import { UserProxy } from "../../providers/security/casl/proxies/user.proxy";
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
}
