import { Field, ID, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsNotEmptyI18N, IsNotEmptyObjectI18N, IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { CreatePriceInput } from "../../price/dto/create-price.input";
import { PriceEntity } from "../../price/entities/price.entity";
import { PaymentIntentEntity } from "../entities/payment-intent.entity";

@InputType()
export class CreatePaymentIntentInput implements Partial<PaymentIntentEntity> {
  @IsNotEmptyI18N()
  @Field()
  clientSecret!: string;

  @IsUUIDI18N()
  @Field(() => ID)
  paymentMethodId!: Id;

  @IsUUIDI18N()
  @Field(() => ID)
  orderId!: Id;

  @IsNotEmptyObjectI18N()
  @Field(() => CreatePriceInput)
  price!: PriceEntity;
}
