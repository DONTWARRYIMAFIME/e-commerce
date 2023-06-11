import { ID } from "@nestjs/graphql";
import { FilterableField, FilterableRelation, FilterableUnPagedRelation } from "@ptc-org/nestjs-query-graphql";
import { Column, Tree, TreeChildren, TreeParent, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { Categories } from "../enums/category.enum";

@Authorize()
@FilterableRelation("parent", () => CategoryEntity, { nullable: true })
@FilterableUnPagedRelation("children", () => CategoryEntity, { nullable: true })
@ObjectType()
@Unique("UNQ_category_code_parent", ["code", "parent"])
@Entity()
@Tree("nested-set")
export class CategoryEntity extends BaseEntity {
  @FilterableField(() => Categories)
  @Column({
    type: "enum",
    enum: Categories,
  })
  code!: Categories;

  @FilterableField()
  @Column({ length: 128 })
  name!: string;

  @FilterableField({ nullable: true })
  @Column({ type: "text", nullable: true })
  description?: string;

  @FilterableField(() => ID, { nullable: true })
  @Column({ nullable: true })
  parentId?: Id;

  @TreeParent()
  parent?: CategoryEntity;

  @TreeChildren()
  children?: CategoryEntity[];
}
