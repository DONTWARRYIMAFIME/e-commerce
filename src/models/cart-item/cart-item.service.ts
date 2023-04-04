import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { UserInputError } from "apollo-server-core";
import { merge, omit } from "lodash";
import { DeepPartial, FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { PriceService } from "../price/price.service";
import { ProductVariantService } from "../product-variant/product-variant.service";
import { WarehouseItemService } from "../warehouse-item/warehouse-item.service";
import { CartItemEntity } from "./entities/cart-item.entity";

@Injectable()
export class CartItemService extends TypeOrmQueryService<CartItemEntity> {
  constructor(
    @InjectRepository(CartItemEntity) repo: Repository<CartItemEntity>,
    private readonly warehouseItemService: WarehouseItemService,
    private readonly productVariantService: ProductVariantService,
    private readonly priceService: PriceService,
  ) {
    super(repo);
  }

  public findOneByCartIdAndProductVariantId(cartId: Id, productVariantId: Id, opts?: FindOptionsWhere<CartItemEntity>): Promise<CartItemEntity> {
    return this.repo.findOneBy({ cartId, productVariantId, ...opts });
  }

  public findOneByCartIdAndProductVariantIdOrFail(cartId: Id, productVariantId: Id, opts?: FindOptionsWhere<CartItemEntity>): Promise<CartItemEntity> {
    return this.repo.findOneByOrFail({ cartId, productVariantId, ...opts });
  }

  public async increaseQuantity(cartId: Id, productVariantId: Id, quantity: number): Promise<CartItemEntity> {
    const cartItem = await this.findOneByCartIdAndProductVariantId(cartId, productVariantId);
    const stock = await this.warehouseItemService.countAvailable(productVariantId);

    const targetQuantity = cartItem ? cartItem.quantity + quantity : quantity;

    if (targetQuantity > stock) {
      throw new UserInputError("Target quantity can not be greater than stock");
    }

    const entity = merge(cartItem, { cartId, productVariantId, quantity: targetQuantity });
    return this.saveOne(entity);
  }

  public async decreaseQuantity(cartId: Id, productVariantId: Id, quantity: number): Promise<CartItemEntity> {
    const cartItem = await this.findOneByCartIdAndProductVariantIdOrFail(cartId, productVariantId);
    const targetQuantity = cartItem.quantity - quantity;

    if (targetQuantity <= 0) {
      return super.deleteOne(cartItem.id);
    }

    const entity = merge(cartItem, { cartId, productVariantId, quantity: targetQuantity });
    return this.saveOne(entity);
  }

  public async saveOne(record: DeepPartial<CartItemEntity>): Promise<CartItemEntity> {
    await this.updatePrice(record);
    return record.id ? super.updateOne(record.id, omit(record, "id")) : super.createOne(record);
  }

  private async updatePrice(record: DeepPartial<CartItemEntity>): Promise<void> {
    const productVariant = record.productVariant || (await this.productVariantService.findOneById(record.productVariantId));
    const price = merge(record.price, { amount: productVariant.price.amount * record.quantity });
    record.price = await this.priceService.saveOne(price);
  }
}
