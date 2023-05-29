import { UseGuards } from "@nestjs/common";
import { Mutation, Resolver } from "@nestjs/graphql";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CaslUser } from "../../providers/security/casl/decorators/casl-user";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { UserProxy } from "../../providers/security/casl/proxies/user.proxy";
import { PaymentIntentEntity } from "./entities/payment-intent.entity";
import { PaymentIntentService } from "./payment-intent.service";

@Resolver(() => PaymentIntentEntity)
export class PaymentIntentResolver {
  constructor(private readonly paymentIntentService: PaymentIntentService) {}

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.CREATE, PaymentIntentEntity)
  @Mutation(() => PaymentIntentEntity)
  public async createOnePaymentIntentFromCart(@CaslUser() userProxy: UserProxy): Promise<PaymentIntentEntity> {
    const user = userProxy.getFromRequest();
    return this.paymentIntentService.createOneFromUserCart(user.id);
  }
}
