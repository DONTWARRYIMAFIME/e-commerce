import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { CreateOneInputType, MutationArgsType } from "@ptc-org/nestjs-query-graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { UpdateProductVariantInput } from "../../product-variant/dto/update-product-variant.input";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";
import { ProductEntity } from "../entities/product.entity";

@InputType()
export class CreateProductInput implements Partial<ProductEntity> {
  @LengthI18N(3, 256)
  @Field()
  title!: string;

  @LengthI18N(3, 4096)
  @Field()
  description!: string;

  @IsUUIDI18N()
  @Field()
  categoryId!: Id;

  @IsUUIDI18N()
  @Field()
  brandId!: Id;

  @IsOptional()
  @Field(() => [UpdateProductVariantInput], { defaultValue: [] })
  productVariants?: ProductVariantEntity[];
}

@InputType()
export class CreateOneProductInputType extends CreateOneInputType("product", CreateProductInput) {}

@ArgsType()
export class CreateOneProductArgsType extends MutationArgsType(CreateOneProductInputType) {}
