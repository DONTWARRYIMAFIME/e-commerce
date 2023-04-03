import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateDeliveryMethodStatusInput } from "./create-delivery-method-status.input";

@InputType()
export class UpdateDeliveryMethodStatusInput extends OmitType(PartialType(CreateDeliveryMethodStatusInput), ["code"]) {}
