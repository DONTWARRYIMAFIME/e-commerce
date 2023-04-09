import { InputType, PartialType, PickType } from "@nestjs/graphql";
import { CreateOrderInput } from "./create-order.input";

@InputType()
export class UpdateOrderInput extends PickType(PartialType(CreateOrderInput), ["status"]) {}
