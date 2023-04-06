import { UpdateOneOptions } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { merge, omit, sumBy } from "lodash";
import { DeepPartial, FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { CartItemService } from "../cart-item/cart-item.service";
import { CartItemEntity } from "../cart-item/entities/cart-item.entity";
import { PriceEntity } from "../price/entities/price.entity";
import { PriceService } from "../price/price.service";
import { CartEntity } from "./entities/cart.entity";

@Injectable()
export class CartService extends TypeOrmQueryService<CartEntity> {
  constructor(@InjectRepository(CartEntity) repo: Repository<CartEntity>, private readonly cartItemService: CartItemService, private readonly priceService: PriceService) {
    super(repo);
  }

  public findOneByIdOrFail(id: Id, opts?: FindOptionsWhere<CartEntity>): Promise<CartEntity> {
    return this.repo.findOneByOrFail({ id, ...opts });
  }

  public findOneByUserId(userId: Id, opts?: FindOptionsWhere<CartEntity>): Promise<CartEntity> {
    return this.repo.findOneBy({ userId, ...opts });
  }

  public async updateOne(id: Id, update: DeepPartial<CartEntity>, opts?: UpdateOneOptions<CartEntity>): Promise<CartEntity> {
    const quantity = this.calculateQuantity(update);
    const price = await this.calculatePrice(update);
    return super.updateOne(id, omit({ quantity, price }, "id"), opts);
  }

  public async addCartItemsToCart(id: Id, cartItems: DeepPartial<CartItemEntity>[]): Promise<CartEntity> {
    await Promise.all(cartItems.map(cartItem => this.cartItemService.increaseQuantity(id, cartItem.productVariantId, cartItem.quantity)));
    const cart = await this.findOneByIdOrFail(id);
    return this.updateOne(id, cart);
  }

  public async removeCartItemsFromCart(id: Id, cartItems: DeepPartial<CartItemEntity>[]): Promise<CartEntity> {
    await Promise.all(cartItems.map(cartItem => this.cartItemService.decreaseQuantity(id, cartItem.productVariantId, cartItem.quantity)));
    const cart = await this.findOneByIdOrFail(id);
    return this.updateOne(id, cart);
  }

  public async emptyCart(id: Id): Promise<CartEntity> {
    await this.cartItemService.deleteMany({ cartId: { eq: id } });
    const cart = await this.findOneByIdOrFail(id);
    return this.updateOne(id, cart);
  }

  private calculateQuantity(cart: DeepPartial<CartEntity>): number {
    return sumBy(cart.cartItems, "quantity");
  }

  private calculatePrice(cart: DeepPartial<CartEntity>): Promise<PriceEntity> {
    const amount = sumBy(
      cart.cartItems.map(cartItem => cartItem.price),
      "amount",
    );

    return this.priceService.saveOne(merge(cart.price, { amount }));
  }
}
