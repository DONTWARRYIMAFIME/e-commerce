import { DeleteOneInputType, MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, InputType } from "@nestjs/graphql";
import { PaymentIntentEntity } from "../entities/payment-intent.entity";

@InputType()
export class ConfirmPaymentIntentInput extends DeleteOneInputType(PaymentIntentEntity) {}

@ArgsType()
export class ConfirmPaymentIntentArgsType extends MutationArgsType(ConfirmPaymentIntentInput) {}
