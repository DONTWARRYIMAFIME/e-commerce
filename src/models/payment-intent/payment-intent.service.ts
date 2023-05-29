import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { InjectStripe } from "nestjs-stripe";
import Stripe from "stripe";
import { Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { CartService } from "../cart/cart.service";
import { PaymentMethodService } from "../payment-method/payment-method.service";
import { PaymentIntentEntity } from "./entities/payment-intent.entity";

@QueryService(PaymentIntentEntity)
export class PaymentIntentService extends TypeOrmQueryService<PaymentIntentEntity> {
  constructor(
    @InjectRepository(PaymentIntentEntity) repo: Repository<PaymentIntentEntity>,
    @InjectStripe() private readonly stripe: Stripe,
    private readonly cartService: CartService,
    private readonly paymentMethodService: PaymentMethodService,
  ) {
    super(repo);
  }

  public async createOneFromUserCart(userId: Id) {
    const cart = await this.cartService.findOneByUserId(userId);
    const paymentMethod = await this.paymentMethodService.findById(cart.paymentMethodId);

    const intent = await this.stripe.paymentIntents.create({
      amount: cart.totalPrice.amount * 100,
      currency: cart.totalPrice.currency,
      payment_method_types: [paymentMethod.code],
    });

    return super.createOne({
      clientSecret: intent.client_secret,
      price: { amount: cart.totalPrice.amount, currency: cart.totalPrice.currency },
      paymentMethod,
    });
  }
}
