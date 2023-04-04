import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { Id } from "../../common/types/id.type";
import { UpdateOneWarehouseArgsType } from "./dto/update-warehouse.input";
import { WarehouseEntity } from "./entities/warehouse.entity";
import { WarehouseService } from "./warehouse.service";

@Resolver(() => WarehouseEntity)
export class WarehouseResolver {
  constructor(private readonly warehouseService: WarehouseService) {}

  @Mutation(() => WarehouseEntity)
  public async addWarehouseItemsToWarehouse(@Args() input: UpdateOneWarehouseArgsType): Promise<WarehouseEntity> {
    const { id, update } = input.input;
    return this.warehouseService.addWarehouseItemsToWarehouse(id as Id, update.warehouseItems);
  }

  @Mutation(() => WarehouseEntity)
  public async removeWarehouseItemsFromWarehouse(@Args() input: UpdateOneWarehouseArgsType): Promise<WarehouseEntity> {
    const { id, update } = input.input;
    return this.warehouseService.removeWarehouseItemsFromWarehouse(id as Id, update.warehouseItems);
  }

  @Mutation(() => WarehouseEntity)
  public async reserveWarehouseItemsInWarehouse(@Args() { input }: UpdateOneWarehouseArgsType): Promise<WarehouseEntity> {
    const { id, update } = input;
    return this.warehouseService.reserve(id as Id, update.warehouseItems);
  }

  @Mutation(() => WarehouseEntity)
  public async cancelReservationForWarehouseItemsInWarehouse(@Args() input: UpdateOneWarehouseArgsType): Promise<WarehouseEntity> {
    const { id, update } = input.input;
    return this.warehouseService.cancelReservation(id as Id, update.warehouseItems);
  }

  @Mutation(() => WarehouseEntity)
  public async releaseWarehouseItemsInWarehouse(@Args() input: UpdateOneWarehouseArgsType): Promise<WarehouseEntity> {
    const { id, update } = input.input;
    return this.warehouseService.completeReservation(id as Id, update.warehouseItems);
  }
}
