import { Injectable } from "@nestjs/common";
import { InjectStripe } from "nestjs-stripe";
import Stripe from "stripe";
import { CartEntity } from "../../../models/cart/entities/cart.entity";

@Injectable()
export class StripeService {
  constructor(@InjectStripe() private readonly stripe: Stripe) {}

  public async createPaymentIntent(cart: CartEntity) {
    const intent = await this.stripe.paymentIntents.create({
      amount: cart.price.amount * 100,
      currency: cart.price.currency,
      payment_method_types: ["card"],
    });

    return { clientSecret: intent.client_secret };
  }

  public async createCheckoutSession(cart: CartEntity): Promise<{ url: string }> {
    const lineItems = this.convertToLineItems(cart);

    const session = await this.stripe.checkout.sessions.create({
      payment_method_types: ["card"],
      mode: "payment",
      line_items: lineItems,
      success_url: "http://localhost:3000/success",
      cancel_url: "http://localhost:3000/cancel",
      locale: "ru",
    });

    //TODO: save in db
    return { url: session.url };
  }

  private convertToLineItems(cart: CartEntity): Stripe.Checkout.SessionCreateParams.LineItem[] {
    return cart.cartItems.map(cartItem => {
      return {
        price_data: {
          currency: "byn",
          product_data: {
            name: "product title - (SKU)",
          },
          unit_amount: cartItem.price.amount * 100,
        },
        quantity: cartItem.quantity,
      };
    });
  }
}
