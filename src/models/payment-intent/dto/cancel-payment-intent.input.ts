import { ArgsType, InputType } from "@nestjs/graphql";
import { DeleteOneInputType, MutationArgsType } from "@ptc-org/nestjs-query-graphql";
import { PaymentIntentEntity } from "../entities/payment-intent.entity";

@InputType()
export class CancelPaymentIntentInput extends DeleteOneInputType(PaymentIntentEntity) {}

@ArgsType()
export class CancelPaymentIntentArgsType extends MutationArgsType(CancelPaymentIntentInput) {}
