import { FilterableField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { BeforeInsert, Column, Index, JoinTable, ManyToMany, ManyToOne, OneToMany } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { FilterableRelation, FilterableUnPagedRelation, UnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { generateSku } from "../../../common/helpers/sku-generator.helper";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { BrandEntity } from "../../brand/entities/brand.entity";
import { CategoryEntity } from "../../category/entities/category.entity";
import { ColorEntity } from "../../color/entities/color.entity";
import { MediaEntity } from "../../media/entities/media.entity";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";
import { SizeEntity } from "../../size/entities/size.entity";

@Authorize()
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
  @Column()
  categoryId!: Id;

  @ManyToOne(() => CategoryEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  category!: CategoryEntity;

  @FilterableField(() => ID)
  @Column()
  brandId!: Id;

  @ManyToOne(() => BrandEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
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

  @BeforeInsert()
  private async generateSKU() {
    for (const variant of this.productVariants) {
      if (!variant.sku) {
        const [category, brand, color, size] = await Promise.all([
          CategoryEntity.findOneBy({ id: this.categoryId }),
          BrandEntity.findOneBy({ id: this.brandId }),
          ColorEntity.findOneBy({ id: variant.colorId }),
          SizeEntity.findOneBy({ id: variant.sizeId }),
        ]);
        variant.sku = generateSku(category.code, brand.code, color.code, size.code);
      }
    }
  }
}
