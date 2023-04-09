import { Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsNotEmptyI18N, IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { CreatePriceInput } from "../../price/dto/create-price.input";
import { PriceEntity } from "../../price/entities/price.entity";
import { ProductVariantEntity } from "../entities/product-variant.entity";

@InputType()
export class CreateProductVariantInput implements Partial<ProductVariantEntity> {
  @IsUUIDI18N()
  @Field()
  productId!: Id;

  @IsUUIDI18N()
  @Field()
  colorId!: Id;

  @IsUUIDI18N()
  @Field()
  sizeId!: Id;

  @IsNotEmptyI18N()
  @Field(() => CreatePriceInput)
  price!: PriceEntity;
}
