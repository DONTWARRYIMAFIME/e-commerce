import { Injectable } from "@nestjs/common";
import { SubjectBeforeFilterHook } from "../../../providers/security/casl/interfaces/hooks.interface";
import { AuthorizableRequest } from "../../../providers/security/casl/interfaces/request.interface";
import { PromotionProductEntity } from "../entities/promotion-product.entity";
import { PromotionProductService } from "../promotion-product.service";

@Injectable()
export class PromotionProductHook implements SubjectBeforeFilterHook<Pick<PromotionProductEntity, "id">> {
  constructor(readonly promotionProductService: PromotionProductService) {}

  async run({ params }: AuthorizableRequest) {
    return this.promotionProductService.findByIdWithRelations(params.input.id);
  }
}
