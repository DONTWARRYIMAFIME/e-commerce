import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { UserInputError } from "apollo-server-core";
import { FindOptionsWhere, MoreThan, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { WarehouseStatus } from "../warehouse/enums/warehouse-status.enum";
import { WarehouseItemEntity } from "./entities/warehouse-item.entity";

@QueryService(WarehouseItemEntity)
export class WarehouseItemService extends TypeOrmQueryService<WarehouseItemEntity> {
  constructor(@InjectRepository(WarehouseItemEntity) repo: Repository<WarehouseItemEntity>) {
    super(repo);
  }

  public findByIdWithRelations(id: Id): Promise<WarehouseItemEntity> {
    return this.repo.findOne({ where: { id }, relations: { productVariant: { product: true } } });
  }

  public findOneByWarehouseIdAndProductVariantId(warehouseId: Id, productVariantId: Id): Promise<WarehouseItemEntity> {
    return this.repo.findOneBy({ warehouseId, productVariantId });
  }

  public findOneByWarehouseIdAndProductVariantIdOrFail(warehouseId: Id, productVariantId: Id): Promise<WarehouseItemEntity> {
    return this.repo.findOneByOrFail({ warehouseId, productVariantId });
  }

  public findManyByProductVariantId(productVariantId, opts?: FindOptionsWhere<WarehouseItemEntity>) {
    return this.repo.findBy({ productVariantId, available: MoreThan(0), warehouse: { status: WarehouseStatus.ACTIVE }, ...opts });
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
    return super.createOne({ warehouseId, productVariantId, stock: quantity });
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

    return super.updateOne(warehouseItemId, { ...rest, stock: stock - quantity });
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

    if (quantity === 0) {
      throw new UserInputError("An attempt to reserve 0 amount of products");
    }

    if (available < quantity) {
      throw new UserInputError("Can not reserve " + quantity + " products. Available value is " + available);
    }

    return super.updateOne(warehouseItemId, { ...rest, reserved: reserved + quantity });
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

    if (quantity === 0) {
      throw new UserInputError("An attempt to cancel reservation for 0 products");
    }

    if (reserved < quantity) {
      throw new UserInputError("Can not release " + quantity + " products. Reserved value is " + reserved);
    }

    return super.updateOne(warehouseItemId, { ...rest, reserved: reserved - quantity });
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

    if (quantity === 0) {
      throw new UserInputError("An attempt to complete reservation for 0 products");
    }

    if (stock < quantity || reserved < quantity) {
      throw new UserInputError("Can not complete reservation for " + quantity + " products. Incorrect value received: " + reserved);
    }

    return super.updateOne(warehouseItemId, { ...rest, stock: stock - quantity, reserved: reserved - quantity });
  }
}
