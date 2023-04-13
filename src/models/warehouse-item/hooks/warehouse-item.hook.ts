import { Injectable } from "@nestjs/common";
import { SubjectBeforeFilterHook } from "../../../providers/security/casl/interfaces/hooks.interface";
import { AuthorizableRequest } from "../../../providers/security/casl/interfaces/request.interface";
import { WarehouseItemEntity } from "../entities/warehouse-item.entity";
import { WarehouseItemService } from "../warehouse-item.service";

@Injectable()
export class WarehouseItemHook implements SubjectBeforeFilterHook<Pick<WarehouseItemEntity, "id">> {
  constructor(readonly warehouseItemService: WarehouseItemService) {}

  async run({ params }: AuthorizableRequest) {
    return this.warehouseItemService.findByIdWithRelations(params.input.id);
  }
}
