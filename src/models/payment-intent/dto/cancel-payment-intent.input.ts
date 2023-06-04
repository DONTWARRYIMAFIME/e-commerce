import { DeleteOneInputType, MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, InputType } from "@nestjs/graphql";
import { PaymentIntentEntity } from "../entities/payment-intent.entity";

@InputType()
export class CancelPaymentIntentInput extends DeleteOneInputType(PaymentIntentEntity) {}

@ArgsType()
export class CancelPaymentIntentArgsType extends MutationArgsType(CancelPaymentIntentInput) {}
