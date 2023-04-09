import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateOrderItemInput } from "./create-order-item.input";

@InputType()
export class UpdateOrderItemInput extends OmitType(PartialType(CreateOrderItemInput), ["orderId"]) {}
