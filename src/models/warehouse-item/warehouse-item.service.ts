import { QueryService, UpdateOneOptions } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { UserInputError } from "apollo-server-core";
import { DeepPartial, FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { ProductVariantService } from "../product-variant/product-variant.service";
import { WarehouseStatus } from "../warehouse/enums/warehouse-status.enum";
import { WarehouseItemEntity } from "./entities/warehouse-item.entity";

@QueryService(WarehouseItemEntity)
export class WarehouseItemService extends TypeOrmQueryService<WarehouseItemEntity> {
  constructor(@InjectRepository(WarehouseItemEntity) repo: Repository<WarehouseItemEntity>, private readonly productVariantService: ProductVariantService) {
    super(repo);
  }

  public findOneByWarehouseIdAndProductVariantId(warehouseId: Id, productVariantId: Id): Promise<WarehouseItemEntity> {
    return this.repo.findOneBy({ warehouseId, productVariantId });
  }

  public findOneByWarehouseIdAndProductVariantIdOrFail(warehouseId: Id, productVariantId: Id): Promise<WarehouseItemEntity> {
    return this.repo.findOneByOrFail({ warehouseId, productVariantId });
  }

  public async createOne(record: DeepPartial<WarehouseItemEntity>): Promise<WarehouseItemEntity> {
    const warehouseItem = await super.createOne(record);
    return this.updateProductVariantStock(warehouseItem);
  }

  public async updateOne(id: Id, update: DeepPartial<WarehouseItemEntity>, opts?: UpdateOneOptions<WarehouseItemEntity>): Promise<WarehouseItemEntity> {
    const warehouseItem = await super.updateOne(id, update, opts);
    return this.updateProductVariantStock(warehouseItem);
  }

  /**
   * Return an amount of available products from all warehouses
   *
   * @param {Id} productVariantId - A product identifier
   * @param {FindOptionsWhere<WarehouseItemEntity>} opts - Where clause additional options.
   * @returns {WarehouseItemEntity} An warehouse item entity
   */
  public countAvailable(productVariantId: Id, opts?: FindOptionsWhere<WarehouseItemEntity>): Promise<number> {
    return this.repo.sum("available", { productVariantId, warehouse: { status: WarehouseStatus.ACTIVE }, ...opts });
  }

  /**
   * Add products to warehouse. Total number of products in warehouse will increase
   *
   * @param {Id}  warehouseId - A warehouse identifier.
   * @param {Id} productVariantId - A product identifier
   * @param {number} quantity - Number of products.
   * @returns {WarehouseItemEntity} An warehouse item entity
   */
  public async increaseStock(warehouseId: Id, productVariantId: Id, quantity: number): Promise<WarehouseItemEntity> {
    const warehouseItem = await this.findOneByWarehouseIdAndProductVariantId(warehouseId, productVariantId);
    if (warehouseItem) {
      const { id: warehouseItemId, stock, ...rest } = warehouseItem;
      return this.updateOne(warehouseItemId, { ...rest, stock: stock + quantity });
    }
    return this.createOne({ warehouseId, productVariantId, stock: quantity });
  }

  /**
   * Remove products from warehouse. Total number of products in warehouse will decrease
   *
   * @param {Id}  warehouseId - A warehouse identifier.
   * @param {Id} productVariantId - A product identifier
   * @param {number} quantity - Number of products.
   * @returns {WarehouseItemEntity} An warehouse item entity
   */
  public async decreaseStock(warehouseId: Id, productVariantId: Id, quantity: number): Promise<WarehouseItemEntity> {
    const { id: warehouseItemId, stock, ...rest } = await this.findOneByWarehouseIdAndProductVariantIdOrFail(warehouseId, productVariantId);

    if (stock < quantity) {
      throw new UserInputError("Can not decrease stock quantity by " + quantity + " products.");
    }

    return this.updateOne(warehouseItemId, { ...rest, stock: stock - quantity });
  }

  /**
   * Reserve products in warehouse
   *
   * @param {Id}  warehouseId - A warehouse identifier.
   * @param {Id} productVariantId - A product identifier
   * @param {number} quantity - Number of items.
   * @returns {WarehouseItemEntity} An warehouse item entity
   */
  public async reserve(warehouseId: Id, productVariantId: Id, quantity: number): Promise<WarehouseItemEntity> {
    const { id: warehouseItemId, reserved, available, ...rest } = await this.findOneByWarehouseIdAndProductVariantIdOrFail(warehouseId, productVariantId);

    if (available < quantity) {
      throw new UserInputError("Can not reserve " + quantity + " products. Available value is " + available);
    }

    return this.updateOne(warehouseItemId, { ...rest, reserved: reserved + quantity });
  }

  /**
   * Cancel product's reservation. Products become available again
   *
   * @param {Id}  warehouseId - A warehouse identifier.
   * @param {Id} productVariantId - A product identifier
   * @param {number} quantity - Number of items.
   * @returns {WarehouseItemEntity} An warehouse item entity
   */
  public async cancelReservation(warehouseId: Id, productVariantId: Id, quantity: number): Promise<WarehouseItemEntity> {
    const { id: warehouseItemId, reserved, ...rest } = await this.findOneByWarehouseIdAndProductVariantIdOrFail(warehouseId, productVariantId);

    if (reserved < quantity) {
      throw new UserInputError("Can not release " + quantity + " products. Reserved value is " + reserved);
    }

    return this.updateOne(warehouseItemId, { ...rest, reserved: reserved - quantity });
  }

  /**
   * Release reserved products from warehouse. Total number of products in warehouse will decrease
   *
   * @param {Id}  warehouseId - A warehouse identifier.
   * @param {Id} productVariantId - A product identifier
   * @param {number} quantity - Number of items.
   * @returns {WarehouseItemEntity} An warehouse item entity
   */
  public async completeReservation(warehouseId: Id, productVariantId: Id, quantity: number): Promise<WarehouseItemEntity> {
    const { id: warehouseItemId, stock, reserved, ...rest } = await this.findOneByWarehouseIdAndProductVariantIdOrFail(warehouseId, productVariantId);

    if (stock < quantity || reserved < quantity) {
      throw new UserInputError("Can not complete reservation for " + quantity + " products. Incorrect value received: " + reserved);
    }

    return this.updateOne(warehouseItemId, { ...rest, stock: stock - quantity, reserved: reserved - quantity });
  }

  private async updateProductVariantStock(warehouseItem: WarehouseItemEntity): Promise<WarehouseItemEntity> {
    const totalStock = await this.countAvailable(warehouseItem.productVariantId);
    warehouseItem.productVariant = await this.productVariantService.updateOne(warehouseItem.productVariantId, { stock: totalStock });
    return warehouseItem;
  }
}
