import { Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { ProductVariantEntity } from "../entities/product-variant.entity";

@InputType()
export class AddProductVariantInput implements Partial<ProductVariantEntity> {
  @IsUUIDI18N()
  @Field()
  id!: Id;
}
