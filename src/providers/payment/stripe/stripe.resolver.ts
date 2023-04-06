import { Mutation, Resolver } from "@nestjs/graphql";
import { CaslUser, UserProxy } from "nest-casl";
import { CartService } from "../../../models/cart/cart.service";
import { CreateSessionResponse } from "./dto/create-session.response";
import { StripeService } from "./stripe.service";

@Resolver()
export class StripeResolver {
  constructor(private readonly stripeService: StripeService, private readonly cartService: CartService) {}

  @Mutation(() => CreateSessionResponse)
  public async createCheckoutSession(@CaslUser() userProxy: UserProxy): Promise<CreateSessionResponse> {
    const user = userProxy.getFromRequest();
    const cart = await this.cartService.findOneByUserId(user.id);
    return this.stripeService.createCheckoutSession(cart);
  }
}
