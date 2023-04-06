import { FilterableField } from "@nestjs-query/query-graphql";
import { Field, ID } from "@nestjs/graphql";
import { Column, Index, JoinTable, ManyToMany, ManyToOne, OneToMany } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation, FilterableUnPagedRelation, UnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { BrandEntity } from "../../brand/entities/brand.entity";
import { CategoryEntity } from "../../category/entities/category.entity";
import { MediaEntity } from "../../media/entities/media.entity";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";

@FilterableRelation("category", () => CategoryEntity)
@FilterableRelation("brand", () => BrandEntity)
@FilterableUnPagedRelation("productVariants", () => ProductVariantEntity)
@UnPagedRelation("media", () => MediaEntity)
@ObjectType()
@Index("INX_product_category", ["category"])
@Index("INX_product_brand", ["brand"])
@Entity()
export class ProductEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 256 })
  title!: string;

  @FilterableField()
  @Column({ type: "text" })
  description!: string;

  @FilterableField(() => ID)
  @Field()
  categoryId!: Id;

  @ManyToOne(() => CategoryEntity, { nullable: false })
  category!: CategoryEntity;

  @FilterableField(() => ID)
  @Field()
  brandId!: Id;

  @ManyToOne(() => BrandEntity, { nullable: false })
  brand!: BrandEntity;

  @OneToMany(() => ProductVariantEntity, productVariant => productVariant.product, {
    eager: true,
    cascade: true,
  })
  productVariants!: ProductVariantEntity[];

  @ManyToMany(() => MediaEntity, {
    eager: true,
    cascade: true,
  })
  @JoinTable({ name: "product_media" })
  media!: MediaEntity[];
}
