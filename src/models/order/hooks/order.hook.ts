import { Injectable } from "@nestjs/common";
import { SubjectBeforeFilterHook } from "../../../providers/security/casl/interfaces/hooks.interface";
import { AuthorizableRequest } from "../../../providers/security/casl/interfaces/request.interface";
import { OrderEntity } from "../entities/order.entity";
import { OrderService } from "../order.service";

@Injectable()
export class OrderHook implements SubjectBeforeFilterHook<Pick<OrderEntity, "id">> {
  constructor(readonly orderService: OrderService) {}

  async run({ params }: AuthorizableRequest) {
    return this.orderService.findById(params.input.id);
  }
}
