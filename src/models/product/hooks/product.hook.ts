import { Injectable } from "@nestjs/common";
import { SubjectBeforeFilterHook } from "../../../providers/security/casl/interfaces/hooks.interface";
import { AuthorizableRequest } from "../../../providers/security/casl/interfaces/request.interface";
import { ProductEntity } from "../entities/product.entity";
import { ProductService } from "../product.service";

@Injectable()
export class ProductHook implements SubjectBeforeFilterHook<Pick<ProductEntity, "id">> {
  constructor(readonly productService: ProductService) {}

  async run({ params }: AuthorizableRequest) {
    return this.productService.findById(params.input.id);
  }
}
