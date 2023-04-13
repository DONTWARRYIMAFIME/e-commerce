import { UseGuards } from "@nestjs/common";
import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { Id } from "../../common/types/id.type";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { WarehouseItemEntity } from "../warehouse-item/entities/warehouse-item.entity";
import { WarehouseItemHook } from "../warehouse-item/hooks/warehouse-item.hook";
import { UpdateOneWarehouseArgsType } from "./dto/update-warehouse.input";
import { WarehouseEntity } from "./entities/warehouse.entity";
import { WarehouseService } from "./warehouse.service";

@Resolver(() => WarehouseEntity)
export class WarehouseResolver {
  constructor(private readonly warehouseService: WarehouseService) {}

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, WarehouseItemEntity, WarehouseItemHook)
  @Mutation(() => WarehouseEntity)
  public async addWarehouseItemsToWarehouse(@Args() input: UpdateOneWarehouseArgsType): Promise<WarehouseEntity> {
    const { id, update } = input.input;
    return this.warehouseService.addWarehouseItemsToWarehouse(id as Id, update.warehouseItems);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, WarehouseItemEntity, WarehouseItemHook)
  @Mutation(() => WarehouseEntity)
  public async removeWarehouseItemsFromWarehouse(@Args() input: UpdateOneWarehouseArgsType): Promise<WarehouseEntity> {
    const { id, update } = input.input;
    return this.warehouseService.removeWarehouseItemsFromWarehouse(id as Id, update.warehouseItems);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, WarehouseItemEntity, WarehouseItemHook)
  @Mutation(() => WarehouseEntity)
  public async reserveWarehouseItemsInWarehouse(@Args() { input }: UpdateOneWarehouseArgsType): Promise<WarehouseEntity> {
    const { id, update } = input;
    return this.warehouseService.reserve(id as Id, update.warehouseItems);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, WarehouseItemEntity, WarehouseItemHook)
  @Mutation(() => WarehouseEntity)
  public async cancelReservationForWarehouseItemsInWarehouse(@Args() input: UpdateOneWarehouseArgsType): Promise<WarehouseEntity> {
    const { id, update } = input.input;
    return this.warehouseService.cancelReservation(id as Id, update.warehouseItems);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, WarehouseItemEntity, WarehouseItemHook)
  @Mutation(() => WarehouseEntity)
  public async releaseWarehouseItemsInWarehouse(@Args() input: UpdateOneWarehouseArgsType): Promise<WarehouseEntity> {
    const { id, update } = input.input;
    return this.warehouseService.completeReservation(id as Id, update.warehouseItems);
  }
}
