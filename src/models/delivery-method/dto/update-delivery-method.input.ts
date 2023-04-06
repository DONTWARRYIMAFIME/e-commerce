import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreateDeliveryMethodInput } from "./create-delivery-method.input";

@InputType()
export class UpdateDeliveryMethodInput extends OmitType(PartialType(CreateDeliveryMethodInput), ["code"]) {}
