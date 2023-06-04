import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { UpdateOneOptions } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { UserInputError } from "apollo-server-core";
import { merge, omit } from "lodash";
import { DeepPartial, FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { ProductVariantService } from "../product-variant/product-variant.service";
import { WarehouseItemService } from "../warehouse-item/warehouse-item.service";
import { CartItemEntity } from "./entities/cart-item.entity";

@Injectable()
export class CartItemService extends TypeOrmQueryService<CartItemEntity> {
  constructor(
    @InjectRepository(CartItemEntity) repo: Repository<CartItemEntity>,
    private readonly warehouseItemService: WarehouseItemService,
    private readonly productVariantService: ProductVariantService,
  ) {
    super(repo);
  }

  public findOneByCartIdAndProductVariantId(cartId: Id, productVariantId: Id, opts?: FindOptionsWhere<CartItemEntity>): Promise<CartItemEntity> {
    return this.repo.findOneBy({ cartId, productVariantId, ...opts });
  }

  public findOneByCartIdAndProductVariantIdOrFail(cartId: Id, productVariantId: Id, opts?: FindOptionsWhere<CartItemEntity>): Promise<CartItemEntity> {
    return this.repo.findOneByOrFail({ cartId, productVariantId, ...opts });
  }

  public async createOne(record: DeepPartial<CartItemEntity>): Promise<CartItemEntity> {
    const entity = await this.updatePrice(record);
    return super.createOne(entity);
  }

  public async updateOne(id: Id, update: DeepPartial<CartItemEntity>, opts?: UpdateOneOptions<CartItemEntity>): Promise<CartItemEntity> {
    const entity = await this.updatePrice(update);
    return super.updateOne(id, entity, opts);
  }

  public async increaseQuantity(cartId: Id, productVariantId: Id, quantity = 1): Promise<CartItemEntity> {
    const cartItem = await this.findOneByCartIdAndProductVariantId(cartId, productVariantId);
    const stock = await this.warehouseItemService.countAvailable(productVariantId);

    const targetQuantity = cartItem ? cartItem.quantity + quantity : quantity;

    if (targetQuantity > stock) {
      throw new UserInputError("Target quantity can not be greater than stock");
    }

    const entity = merge<DeepPartial<CartItemEntity>, DeepPartial<CartItemEntity>>(cartItem, {
      cartId,
      productVariantId,
      quantity: targetQuantity,
    });

    return cartItem ? this.updateOne(cartItem.id, omit(entity, "id")) : this.createOne(entity);
  }

  public async decreaseQuantity(cartId: Id, productVariantId: Id, quantity = 1): Promise<CartItemEntity> {
    const cartItem = await this.findOneByCartIdAndProductVariantIdOrFail(cartId, productVariantId);
    const targetQuantity = cartItem.quantity - quantity;

    if (targetQuantity <= 0) {
      return super.deleteOne(cartItem.id);
    }

    const entity = merge<DeepPartial<CartItemEntity>, DeepPartial<CartItemEntity>>(cartItem, {
      cartId,
      productVariantId,
      quantity: targetQuantity,
    });

    return this.updateOne(cartItem.id, omit(entity, "id"));
  }

  private async updatePrice(entity: DeepPartial<CartItemEntity>): Promise<DeepPartial<CartItemEntity>> {
    const productVariant = await this.productVariantService.findById(entity.productVariantId);
    const priceAmount = productVariant.price.amount * entity.quantity;
    return merge<DeepPartial<CartItemEntity>, DeepPartial<CartItemEntity>>(entity, { price: { amount: priceAmount } });
  }
}
