import { Field, InputType } from "@nestjs/graphql";
import { IsEnum, IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsArrayI18N, IsUUIDI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { CategoryEntity } from "../entities/category.entity";
import { Categories } from "../enums/category.enum";
import { SelectCategoryInput } from "./select-category.input";

@InputType()
export class CreateCategoryInput implements Partial<CategoryEntity> {
  @IsEnum(Categories)
  @Field()
  code!: Categories;

  @LengthI18N(2, 128)
  @Field()
  name!: string;

  @IsOptional()
  @LengthI18N(2, 1024)
  @Field({ nullable: true })
  description!: string;

  @IsOptional()
  @IsUUIDI18N()
  @Field({ nullable: true })
  parentId!: Id;

  @IsOptional()
  @IsArrayI18N()
  @Field(() => [SelectCategoryInput], { defaultValue: [] })
  children!: CategoryEntity[];
}
