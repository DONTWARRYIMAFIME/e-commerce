import { MutationArgsType, UpdateManyInputType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { ProductVariantEntity } from "../entities/product-variant.entity";

@InputType()
export class AddProductVariantInput implements Partial<ProductVariantEntity> {
  @IsUUIDI18N()
  @Field()
  id!: Id;
}

@InputType()
export class AddManyProductVariantsInputType extends UpdateManyInputType(ProductVariantEntity, AddProductVariantInput) {}

@ArgsType()
export class AddManyProductVariantsArgsType extends MutationArgsType(AddManyProductVariantsInputType) {}
