import { Injectable } from "@nestjs/common";
import { SubjectBeforeFilterHook } from "../../../providers/security/casl/interfaces/hooks.interface";
import { AuthorizableRequest } from "../../../providers/security/casl/interfaces/request.interface";
import { WishlistEntity } from "../entities/wishlist.entity";
import { WishlistService } from "../wishlist.service";

@Injectable()
export class WishlistHook implements SubjectBeforeFilterHook<Pick<WishlistEntity, "id">> {
  constructor(readonly wishlistService: WishlistService) {}

  async run({ params }: AuthorizableRequest) {
    return this.wishlistService.findById(params.input.id);
  }
}
