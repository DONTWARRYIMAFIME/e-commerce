import { WarehouseItemEntity } from "../entities/warehouse-item.entity";

export class WarehouseItemCreateEvent {
  constructor(public readonly warehouseItemEntity: WarehouseItemEntity) {}
}
