import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { Id } from "../../common/types/id.type";
import { ManageWarehouseItemsArgsType } from "../warehouse-item/dto/manage-warehouse-item.input";
import { WarehouseItemService } from "../warehouse-item/warehouse-item.service";
import { WarehouseEntity } from "./entities/warehouse.entity";
import { WarehouseService } from "./warehouse.service";

@Resolver(() => WarehouseEntity)
export class WarehouseResolver {
  constructor(private readonly warehouseService: WarehouseService, private readonly warehouseItemService: WarehouseItemService) {}

  @Mutation(() => WarehouseEntity)
  public async addWarehouseItems(@Args() { input }: ManageWarehouseItemsArgsType): Promise<WarehouseEntity> {
    const { id, update } = input;
    const { productVariantId, quantity } = update;
    await this.warehouseItemService.increaseStock(id as Id, productVariantId, quantity);
    return this.warehouseService.findById(id);
  }

  @Mutation(() => WarehouseEntity)
  public async removeWarehouseItems(@Args() { input }: ManageWarehouseItemsArgsType): Promise<WarehouseEntity> {
    const { id, update } = input;
    const { productVariantId, quantity } = update;
    await this.warehouseItemService.decreaseStock(id as Id, productVariantId, quantity);
    return this.warehouseService.findById(id);
  }

  @Mutation(() => WarehouseEntity)
  public async reserveWarehouseItems(@Args() { input }: ManageWarehouseItemsArgsType): Promise<WarehouseEntity> {
    const { id, update } = input;
    const { productVariantId, quantity } = update;
    await this.warehouseItemService.reserve(id as Id, productVariantId, quantity);
    return this.warehouseService.findById(id);
  }

  @Mutation(() => WarehouseEntity)
  public async cancelReservationForWarehouseItems(@Args() { input }: ManageWarehouseItemsArgsType): Promise<WarehouseEntity> {
    const { id, update } = input;
    const { productVariantId, quantity } = update;
    await this.warehouseItemService.reserve(id as Id, productVariantId, quantity);
    return this.warehouseService.findById(id);
  }

  @Mutation(() => WarehouseEntity)
  public async releaseWarehouseItems(@Args() { input }: ManageWarehouseItemsArgsType): Promise<WarehouseEntity> {
    const { id, update } = input;
    const { productVariantId, quantity } = update;
    await this.warehouseItemService.completeReservation(id as Id, productVariantId, quantity);
    return this.warehouseService.findById(id);
  }
}
