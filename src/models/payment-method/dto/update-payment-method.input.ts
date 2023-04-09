import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreatePaymentMethodInput } from "./create-payment-method.input";

@InputType()
export class UpdatePaymentMethodInput extends OmitType(PartialType(CreatePaymentMethodInput), ["code"]) {}
