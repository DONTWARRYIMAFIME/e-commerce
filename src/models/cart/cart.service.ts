import { UpdateOneOptions } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable, Logger } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { merge, omit, sumBy } from "lodash";
import { DeepPartial, FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { CartItemService } from "../cart-item/cart-item.service";
import { CartItemEntity } from "../cart-item/entities/cart-item.entity";
import { DeliveryMethodService } from "../delivery-method/delivery-method.service";
import { CartEntity } from "./entities/cart.entity";

@Injectable()
export class CartService extends TypeOrmQueryService<CartEntity> {
  private readonly logger = new Logger(CartService.name);

  constructor(
    @InjectRepository(CartEntity) repo: Repository<CartEntity>,
    private readonly cartItemService: CartItemService,
    private readonly deliveryMethodService: DeliveryMethodService,
  ) {
    super(repo);
  }

  public findById(id: Id): Promise<CartEntity> {
    return this.repo.findOneBy({ id });
  }

  public findOneByIdOrFail(id: Id, opts?: FindOptionsWhere<CartEntity>): Promise<CartEntity> {
    return this.repo.findOneByOrFail({ id, ...opts });
  }

  public findOneByUserId(userId: Id, opts?: FindOptionsWhere<CartEntity>): Promise<CartEntity> {
    return this.repo.findOne({ where: { userId }, relations: { cartItems: { productVariant: { product: true } } }, ...opts });
  }

  public async updateOne(cartId: Id, update: DeepPartial<CartEntity>, opts?: UpdateOneOptions<CartEntity>): Promise<CartEntity> {
    const { deliveryMethodId, deliveryAddressId, paymentMethodId } = update;
    const { id, ...cart } = await this.findOneByIdOrFail(cartId);

    if (deliveryMethodId) {
      const deliveryMethod = await this.deliveryMethodService.findOneById(deliveryMethodId);

      cart.deliveryMethodId = deliveryMethod.id;
      cart.deliveryPrice.amount = deliveryMethod.price.amount;
      this.logger.log(`Delivery mode switched. Current delivery price: ${cart.deliveryPrice.amount}`);
    }

    if (deliveryAddressId) {
      cart.deliveryAddressId = deliveryAddressId;
    }

    if (paymentMethodId) {
      cart.paymentMethodId = paymentMethodId;
    }

    const updatedCart = await super.updateOne(cartId, merge(update, cart), opts);
    return this.recalculateCartTotal(cartId, omit(updatedCart, ["id"]));
  }

  public async addCartItemsToCart(id: Id, cartItems: DeepPartial<CartItemEntity>[]): Promise<CartEntity> {
    await Promise.all(cartItems.map(cartItem => this.cartItemService.increaseQuantity(id, cartItem.productVariantId, cartItem.quantity)));
    const cart = await this.findOneByIdOrFail(id);
    return this.recalculateCartTotal(id, omit(cart, ["id"]));
  }

  public async removeCartItemsFromCart(id: Id, cartItems: DeepPartial<CartItemEntity>[]): Promise<CartEntity> {
    console.log("cartItems", cartItems);
    await Promise.all(cartItems.map(cartItem => this.cartItemService.decreaseQuantity(id, cartItem.productVariantId, cartItem?.quantity)));
    const cart = await this.findOneByIdOrFail(id);
    return this.recalculateCartTotal(id, omit(cart, ["id"]));
  }

  public async resetCart(id: Id): Promise<CartEntity> {
    await super.updateOne(id, { paymentMethodId: null, deliveryAddressId: null, deliveryMethodId: null });
    return this.emptyCart(id);
  }

  public async emptyCart(id: Id): Promise<CartEntity> {
    await this.cartItemService.deleteMany({ cartId: { eq: id } });
    const cart = await this.findOneByIdOrFail(id);
    return this.recalculateCartTotal(id, omit(cart, ["id"]));
  }

  private async recalculateCartTotal(cartId, cart: Omit<CartEntity, "id">): Promise<CartEntity> {
    cart.quantity = sumBy(cart.cartItems, cartItem => cartItem.quantity);
    cart.subtotalPrice.amount = sumBy(cart.cartItems, cartItem => cartItem.price.amount);
    cart.taxPrice.amount = cart.subtotalPrice.amount * 0.2;
    cart.totalPrice.amount = cart.subtotalPrice.amount + cart.taxPrice.amount + cart.deliveryPrice.amount;

    this.logger.log(
      `Cart totals recalculated. Quantity: ${cart.quantity}, Subtotal: ${cart.subtotalPrice.amount}, Tax: ${cart.taxPrice.amount}, Total: ${cart.totalPrice.amount}, Delivery: ${cart.deliveryMethod}`,
    );

    return super.updateOne(cartId, cart);
  }
}
