import { Injectable } from "@nestjs/common";
import { SubjectBeforeFilterHook } from "../../../providers/security/casl/interfaces/hooks.interface";
import { AuthorizableRequest } from "../../../providers/security/casl/interfaces/request.interface";
import { CartService } from "../cart.service";
import { CartEntity } from "../entities/cart.entity";

@Injectable()
export class CartHook implements SubjectBeforeFilterHook<Pick<CartEntity, "id">> {
  constructor(readonly cartService: CartService) {}

  async run({ params }: AuthorizableRequest) {
    return this.cartService.findById(params.input.id);
  }
}
