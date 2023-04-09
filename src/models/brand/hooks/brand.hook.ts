import { Injectable } from "@nestjs/common";
import { SubjectBeforeFilterHook } from "../../../providers/security/casl/interfaces/hooks.interface";
import { AuthorizableRequest } from "../../../providers/security/casl/interfaces/request.interface";
import { BrandService } from "../brand.service";
import { BrandEntity } from "../entities/brand.entity";

@Injectable()
export class BrandHook implements SubjectBeforeFilterHook<Pick<BrandEntity, "id">> {
  constructor(readonly brandService: BrandService) {}

  async run({ params }: AuthorizableRequest) {
    return this.brandService.findById(params.input.id);
  }
}
