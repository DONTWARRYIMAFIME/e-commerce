import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { SelectProductVariantInput } from "../../product-variant/dto/select-product-variant.input";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";
import { WishlistEntity } from "../entities/wishlist.entity";

@InputType()
export class CreateWishlistInput implements Partial<WishlistEntity> {
  @IsUUIDI18N()
  @Field()
  userId: Id;

  @IsOptional()
  @Field(() => [SelectProductVariantInput], { defaultValue: [] })
  productVariants?: ProductVariantEntity[];
}
