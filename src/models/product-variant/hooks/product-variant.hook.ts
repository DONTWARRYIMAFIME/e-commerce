import { Injectable } from "@nestjs/common";
import { SubjectBeforeFilterHook } from "../../../providers/security/casl/interfaces/hooks.interface";
import { AuthorizableRequest } from "../../../providers/security/casl/interfaces/request.interface";
import { ProductVariantEntity } from "../entities/product-variant.entity";
import { ProductVariantService } from "../product-variant.service";

@Injectable()
export class ProductVariantHook implements SubjectBeforeFilterHook<Pick<ProductVariantEntity, "id">> {
  constructor(readonly productVariantService: ProductVariantService) {}

  async run({ params }: AuthorizableRequest) {
    return this.productVariantService.findByIdWithProduct(params.input.id);
  }
}
