import { FilterableField } from "@nestjs-query/query-graphql";
import { Column, JoinTable, ManyToMany, OneToMany } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableUnPagedRelation, UnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { BaseEntity } from "../../base.entity";
import { MediaEntity } from "../../media/entities/media.entity";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";

@FilterableUnPagedRelation("productVariants", () => ProductVariantEntity)
@UnPagedRelation("media", () => MediaEntity)
@ObjectType()
@Entity()
export class ProductEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 256 })
  title!: string;

  @FilterableField()
  @Column({ type: "text" })
  description!: string;

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
