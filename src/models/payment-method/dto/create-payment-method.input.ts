import { CreateOneInputType, MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { IsBooleanI18N, IsEnumI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { PaymentMethodEntity } from "../entities/payment-method.entity";
import { PaymentMethodStatus } from "../enums/payment-method-status.enum";
import { PaymentMethods } from "../enums/payment-methods.enum";

@InputType()
export class CreatePaymentMethodInput implements Partial<PaymentMethodEntity> {
  @IsEnumI18N(PaymentMethods)
  @Field(() => PaymentMethods)
  code!: PaymentMethods;

  @IsOptional()
  @IsBooleanI18N()
  @Field({ defaultValue: false })
  online?: boolean;

  @LengthI18N(2, 128)
  @Field()
  name!: string;

  @IsOptional()
  @LengthI18N(2, 1024)
  @Field({ nullable: true })
  description!: string;

  @IsOptional()
  @IsEnumI18N(PaymentMethodStatus)
  @Field(() => PaymentMethodStatus, { nullable: true })
  status?: PaymentMethodStatus;
}

@InputType()
export class CreateOnePaymentMethodInput extends CreateOneInputType("paymentMethod", CreatePaymentMethodInput) {}

@ArgsType()
export class CreateOnePaymentMethodArgsType extends MutationArgsType(CreateOnePaymentMethodInput) {}
