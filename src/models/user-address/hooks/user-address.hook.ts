import { Injectable } from "@nestjs/common";
import { SubjectBeforeFilterHook } from "../../../providers/security/casl/interfaces/hooks.interface";
import { AuthorizableRequest } from "../../../providers/security/casl/interfaces/request.interface";
import { UserAddressEntity } from "../entities/user-address.entity";
import { UserAddressService } from "../user-address.service";

@Injectable()
export class UserAddressHook implements SubjectBeforeFilterHook<Pick<UserAddressEntity, "id">> {
  constructor(readonly userAddressService: UserAddressService) {}

  async run({ params }: AuthorizableRequest) {
    return this.userAddressService.findById(params.input.id);
  }
}
