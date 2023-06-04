import { ArgsType, InputType } from "@nestjs/graphql";
import { DeleteOneInputType, MutationArgsType } from "@ptc-org/nestjs-query-graphql";
import { PaymentIntentEntity } from "../entities/payment-intent.entity";

@InputType()
export class ConfirmPaymentIntentInput extends DeleteOneInputType(PaymentIntentEntity) {}

@ArgsType()
export class ConfirmPaymentIntentArgsType extends MutationArgsType(ConfirmPaymentIntentInput) {}
