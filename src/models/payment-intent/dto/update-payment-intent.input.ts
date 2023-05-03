import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreatePaymentIntentInput } from "./create-payment-intent.input";

@InputType()
export class UpdatePaymentIntentInput extends OmitType(PartialType(CreatePaymentIntentInput), ["orderId"]) {}
