import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { ManageWarehouseItem } from "../warehouse-item/dto/manage-warehouse-item.input";
import { WarehouseItemService } from "../warehouse-item/warehouse-item.service";
import { WarehouseEntity } from "./entities/warehouse.entity";

@Injectable()
export class WarehouseService extends TypeOrmQueryService<WarehouseEntity> {
  constructor(@InjectRepository(WarehouseEntity) repo: Repository<WarehouseEntity>, private readonly warehouseItemService: WarehouseItemService) {
    super(repo);
  }

  public findOneByIdOrFail(id: Id, opts?: FindOptionsWhere<WarehouseEntity>): Promise<WarehouseEntity> {
    return this.repo.findOneByOrFail({ id, ...opts });
  }

  public async addWarehouseItemsToWarehouse(id: Id, warehouseItems: ManageWarehouseItem[]): Promise<WarehouseEntity> {
    await Promise.all(warehouseItems.map(warehouseItem => this.warehouseItemService.increaseStock(id, warehouseItem.productVariantId, warehouseItem.quantity)));
    return this.findOneByIdOrFail(id);
  }

  public async removeWarehouseItemsFromWarehouse(id: Id, warehouseItems: ManageWarehouseItem[]): Promise<WarehouseEntity> {
    await Promise.all(warehouseItems.map(warehouseItem => this.warehouseItemService.decreaseStock(id, warehouseItem.productVariantId, warehouseItem.quantity)));
    return this.findOneByIdOrFail(id);
  }

  public async reserve(id: Id, warehouseItems: ManageWarehouseItem[]): Promise<WarehouseEntity> {
    await Promise.all(warehouseItems.map(warehouseItem => this.warehouseItemService.reserve(id, warehouseItem.productVariantId, warehouseItem.quantity)));
    return this.findOneByIdOrFail(id);
  }

  public async cancelReservation(id: Id, warehouseItems: ManageWarehouseItem[]): Promise<WarehouseEntity> {
    await Promise.all(warehouseItems.map(warehouseItem => this.warehouseItemService.cancelReservation(id, warehouseItem.productVariantId, warehouseItem.quantity)));
    return this.findOneByIdOrFail(id);
  }

  public async completeReservation(id: Id, warehouseItems: ManageWarehouseItem[]): Promise<WarehouseEntity> {
    await Promise.all(warehouseItems.map(warehouseItem => this.warehouseItemService.completeReservation(id, warehouseItem.productVariantId, warehouseItem.quantity)));
    return this.findOneByIdOrFail(id);
  }
}
