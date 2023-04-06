import { QueryArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { CartEntity } from "../../cart/entities/cart.entity";
import { CategoryEntity } from "../entities/category.entity";

@InputType()
export class SelectCategoryInput implements Pick<CartEntity, "id"> {
  @IsUUIDI18N()
  @Field()
  id!: Id;
}

@ArgsType()
export class CategoryItemQuery extends QueryArgsType(CategoryEntity) {}

export const CategoryItemConnection = CategoryItemQuery.ConnectionType;
