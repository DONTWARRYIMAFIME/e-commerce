import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsPositiveI18N } from "../../../providers/i18n/i18n.decorators";
import { PriceEntity } from "../entities/price.entity";

@InputType()
export class CreatePriceInput implements Partial<PriceEntity> {
  @IsPositiveI18N()
  @Field()
  amount!: number;

  @IsOptional()
  @Field({ nullable: true })
  currencyId?: Id;
}
