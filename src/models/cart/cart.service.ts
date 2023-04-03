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

  public findOneByIdOrFail(cartId: Id, opts?: FindOptionsWhere<CartEntity>): Promise<CartEntity> {
    return this.repo.findOneByOrFail({ id: cartId, ...opts });
  }

  public findOneByUserId(userId: Id, opts?: FindOptionsWhere<CartEntity>): Promise<CartEntity> {
    return this.repo.findOneBy({ userId, ...opts });
  }

  public async updateOne(id: Id, update: DeepPartial<CartEntity>, opts?: UpdateOneOptions<CartEntity>): Promise<CartEntity> {
    const cart = await this.findOneByIdOrFail(id);
    const quantity = this.calculateQuantity(cart);
    const price = await this.calculatePrice(cart);
    return super.updateOne(id, omit({ ...update, quantity, price }, "id"), opts);
  }

  public async addCartItemToCart(cartId: Id, cartItem: DeepPartial<CartItemEntity>): Promise<CartEntity> {
    await this.cartItemService.increaseQuantity(cartId, cartItem.productVariantId, cartItem.quantity);
    return this.updateOne(cartId, cartItem);
  }

  public async removeCartItemFromCart(cartId: Id, cartItem: DeepPartial<CartItemEntity>): Promise<CartEntity> {
    await this.cartItemService.decreaseQuantity(cartId, cartItem.productVariantId, cartItem.quantity);
    return this.updateOne(cartId, cartItem);
  }

  private calculateQuantity(cart: CartEntity): number {
    return sumBy(cart.cartItems, "quantity");
  }

  private calculatePrice(cart: CartEntity): Promise<PriceEntity> {
    const amount = sumBy(
      cart.cartItems.map(cartItem => cartItem.price),
      "amount",
    );

    return this.priceService.saveOne(merge(cart.price, { amount }));
  }
}
