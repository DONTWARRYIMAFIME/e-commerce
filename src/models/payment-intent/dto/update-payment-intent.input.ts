import { InputType, PartialType } from "@nestjs/graphql";
import { CreatePaymentIntentInput } from "./create-payment-intent.input";

@InputType()
export class UpdatePaymentIntentInput extends PartialType(CreatePaymentIntentInput) {}
