import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { IsEnumI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { PaymentMethodEntity } from "../entities/payment-method.entity";
import { PaymentMethodStatus } from "../enums/payment-method-status.enum";
import { PaymentMethods } from "../enums/payment-methods.enum";

@InputType()
export class CreatePaymentMethodInput implements Partial<PaymentMethodEntity> {
  @IsEnumI18N(PaymentMethods)
  @Field(() => PaymentMethods)
  code!: PaymentMethods;

  @LengthI18N(2, 128)
  @Field()
  name!: string;

  @IsOptional()
  @IsEnumI18N(PaymentMethodStatus)
  @Field(() => PaymentMethodStatus, { nullable: true })
  status?: PaymentMethodStatus;
}
