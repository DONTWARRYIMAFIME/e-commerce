import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { EventEmitter2 } from "@nestjs/event-emitter";
import { InjectRepository } from "@nestjs/typeorm";
import { InjectStripe } from "nestjs-stripe";
import Stripe from "stripe";
import { Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CartService } from "../cart/cart.service";
import { PaymentMethodService } from "../payment-method/payment-method.service";
import { PaymentIntentEntity } from "./entities/payment-intent.entity";
import { PaymentIntentStatus } from "./enum/payment-intent-status.enum";
import { PaymentIntentUpdateEvent } from "./events/payment-intent-update.event";

@QueryService(PaymentIntentEntity)
export class PaymentIntentService extends TypeOrmQueryService<PaymentIntentEntity> {
  constructor(
    @InjectRepository(PaymentIntentEntity) repo: Repository<PaymentIntentEntity>,
    @InjectStripe() private readonly stripe: Stripe,
    private readonly cartService: CartService,
    private readonly paymentMethodService: PaymentMethodService,
    private readonly eventEmitter: EventEmitter2,
  ) {
    super(repo);
  }

  public findOneByIntentIdOrFail(intentId: string): Promise<PaymentIntentEntity> {
    return this.repo.findOneByOrFail({ intentId });
  }

  public async createOneFromUserCart(userId: Id): Promise<PaymentIntentEntity> {
    const cart = await this.cartService.findOneByUserId(userId);
    const paymentMethod = await this.paymentMethodService.findById(cart.paymentMethodId);

    const intent = await this.stripe.paymentIntents.create({
      amount: Math.ceil(cart.totalPrice.amount * 100),
      currency: cart.totalPrice.currency,
      payment_method_types: [paymentMethod.code],
    });

    return super.createOne({
      intentId: intent.id,
      clientSecret: intent.client_secret,
      price: { amount: cart.totalPrice.amount, currency: cart.totalPrice.currency },
      paymentMethod,
      status: intent.status as PaymentIntentStatus,
    });
  }

  public async updateStatusByIntentId(intentId: string, status: PaymentIntentStatus): Promise<PaymentIntentEntity> {
    const intent = await this.findOneByIntentIdOrFail(intentId);
    return this.updateStatus(intent.id, status);
  }

  public async updateStatus(id: Id, status: PaymentIntentStatus): Promise<PaymentIntentEntity> {
    const intent = await super.updateOne(id, { status });
    this.eventEmitter.emit(JSON.stringify({ subject: PaymentIntentEntity.name, action: Actions.UPDATE }), new PaymentIntentUpdateEvent(intent));
    return intent;
  }

  public async cancel(id: Id): Promise<PaymentIntentEntity> {
    const paymentIntent = await super.findById(id);
    const intent = await this.stripe.paymentIntents.cancel(paymentIntent.intentId);
    return super.updateOne(id, { status: intent.status as PaymentIntentStatus });
  }
}
