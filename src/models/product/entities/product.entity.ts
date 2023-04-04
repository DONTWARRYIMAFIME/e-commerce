import { FilterableField } from "@nestjs-query/query-graphql";
import { Column, OneToMany } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableUnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { BaseEntity } from "../../base.entity";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";

@FilterableUnPagedRelation("productVariants", () => ProductVariantEntity)
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
}
