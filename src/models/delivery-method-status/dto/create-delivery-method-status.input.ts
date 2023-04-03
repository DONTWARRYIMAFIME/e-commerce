import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsEnumI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { DeliveryMethodStatusEntity } from "../entities/delivery-method-status.entity";
import { DeliveryMethodStatus } from "../enums/delivery-method-status.enum";

@InputType()
export class CreateDeliveryMethodStatusInput implements Partial<DeliveryMethodStatusEntity> {
  @IsEnumI18N(DeliveryMethodStatus)
  @Field()
  code!: DeliveryMethodStatus;

  @LengthI18N(2, 64)
  @Field()
  name!: string;

  @IsOptional()
  @Field({ nullable: true })
  statusId?: Id;
}
