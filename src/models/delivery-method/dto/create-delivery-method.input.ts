import { Field, InputType } from "@nestjs/graphql";
import { IsNotEmpty, IsOptional } from "class-validator";
import { IsEnumI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { CreatePriceInput } from "../../price/dto/create-price.input";
import { PriceEntity } from "../../price/entities/price.entity";
import { DeliveryMethodEntity } from "../entities/delivery-method.entity";
import { DeliveryMethodStatus } from "../enums/delivery-method-status.enum";
import { DeliveryMethod } from "../enums/delivery-method.enum";

@InputType()
export class CreateDeliveryMethodInput implements Partial<DeliveryMethodEntity> {
  @IsEnumI18N(DeliveryMethod)
  @Field()
  code!: DeliveryMethod;

  @LengthI18N(2, 64)
  @Field()
  name!: string;

  @IsNotEmpty()
  @Field(() => CreatePriceInput)
  price!: PriceEntity;

  @IsOptional()
  @IsEnumI18N(DeliveryMethodStatus)
  @Field(() => DeliveryMethodStatus, { nullable: true })
  status?: DeliveryMethodStatus;
}
