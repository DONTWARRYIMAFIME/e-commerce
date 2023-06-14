import { UseGuards } from "@nestjs/common";
import { Args, Query, Resolver } from "@nestjs/graphql";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { ReadWarehouseItemInput } from "./dto/read-warehouse-item.input";
import { WarehouseItemEntity } from "./entities/warehouse-item.entity";
import { WarehouseItemService } from "./warehouse-item.service";

@Resolver(() => WarehouseItemEntity)
export class WarehouseItemResolver {
  constructor(private readonly warehouseItemService: WarehouseItemService) {}

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.READ, WarehouseItemEntity)
  @Query(() => WarehouseItemEntity, { name: "warehouseItem" })
  public async readOneWarehouseItem(@Args("input") input: ReadWarehouseItemInput): Promise<WarehouseItemEntity> {
    const { warehouseId, productVariantId } = input;
    return this.warehouseItemService.findOneByWarehouseIdAndProductVariantIdOrFail(warehouseId, productVariantId);
  }
}
