import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { WarehouseItemService } from "../warehouse-item/warehouse-item.service";
import { OrderItemEntity } from "./entities/order-item.entity";

@Injectable()
export class OrderItemService extends TypeOrmQueryService<OrderItemEntity> {
  constructor(@InjectRepository(OrderItemEntity) repo: Repository<OrderItemEntity>, private readonly warehouseItemService: WarehouseItemService) {
    super(repo);
  }

  public findManyByOrderId(orderId, opts?: FindOptionsWhere<OrderItemEntity>): Promise<OrderItemEntity[]> {
    return this.repo.findBy({ orderId, ...opts });
  }

  public async releaseOrderItems(orderId): Promise<OrderItemEntity[]> {
    const orderItems = await this.findManyByOrderId(orderId);
    await Promise.all(
      orderItems.map(orderItem => {
        const { warehouseId, productVariantId, quantity } = orderItem;
        return this.warehouseItemService.reserve(warehouseId, productVariantId, quantity);
      }),
    );
    return orderItems;
  }

  public async cancelOrderItems(orderId): Promise<OrderItemEntity[]> {
    const orderItems = await this.findManyByOrderId(orderId);
    await Promise.all(
      orderItems.map(orderItem => {
        const { warehouseId, productVariantId, quantity } = orderItem;
        return this.warehouseItemService.cancelReservation(warehouseId, productVariantId, quantity);
      }),
    );
    return orderItems;
  }

  public async returnOrderItems(orderId): Promise<OrderItemEntity[]> {
    const orderItems = await this.findManyByOrderId(orderId);
    await Promise.all(
      orderItems.map(orderItem => {
        const { warehouseId, productVariantId, quantity } = orderItem;
        return this.warehouseItemService.increaseStock(warehouseId, productVariantId, quantity);
      }),
    );
    return orderItems;
  }
}
