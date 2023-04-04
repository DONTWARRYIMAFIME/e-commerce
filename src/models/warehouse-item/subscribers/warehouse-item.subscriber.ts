import { DataSource, EntitySubscriberInterface, EventSubscriber, InsertEvent, UpdateEvent } from "typeorm";
import { ProductVariantService } from "../../product-variant/product-variant.service";
import { WarehouseItemEntity } from "../entities/warehouse-item.entity";
import { WarehouseItemService } from "../warehouse-item.service";

@EventSubscriber()
export class WarehouseItemSubscriber implements EntitySubscriberInterface<WarehouseItemEntity> {
  constructor(private readonly dataSource: DataSource, private warehouseItemService: WarehouseItemService, private readonly productVariantService: ProductVariantService) {
    dataSource.subscribers.push(this);
  }

  public listenTo() {
    return WarehouseItemEntity;
  }

  public async afterInsert(event: InsertEvent<WarehouseItemEntity>) {
    await this.updateProductVariantStock(event.entity);
  }

  public async afterUpdate(event: UpdateEvent<WarehouseItemEntity>) {
    await this.updateProductVariantStock(event.entity as WarehouseItemEntity);
  }

  private async updateProductVariantStock(entity: WarehouseItemEntity) {
    const totalStock = await this.warehouseItemService.countAvailable(entity.productVariantId);
    entity.productVariant = await this.productVariantService.updateOne(entity.productVariantId, { stock: totalStock });
  }
}
