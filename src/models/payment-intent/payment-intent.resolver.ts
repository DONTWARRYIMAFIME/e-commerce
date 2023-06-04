import { UseGuards } from "@nestjs/common";
import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { Id } from "../../common/types/id.type";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CaslUser } from "../../providers/security/casl/decorators/casl-user";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { UserProxy } from "../../providers/security/casl/proxies/user.proxy";
import { CancelPaymentIntentArgsType } from "./dto/cancel-payment-intent.input";
import { ConfirmPaymentIntentArgsType } from "./dto/confirm-payment-intent.input";
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

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, PaymentIntentEntity)
  @Mutation(() => PaymentIntentEntity)
  public async confirmOnePaymentIntent(@Args() args: ConfirmPaymentIntentArgsType): Promise<PaymentIntentEntity> {
    const { id } = args.input;
    return this.paymentIntentService.cancel(id as Id);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, PaymentIntentEntity)
  @Mutation(() => PaymentIntentEntity)
  public async cancelOnePaymentIntent(@Args() args: CancelPaymentIntentArgsType): Promise<PaymentIntentEntity> {
    const { id } = args.input;
    return this.paymentIntentService.cancel(id as Id);
  }
}
