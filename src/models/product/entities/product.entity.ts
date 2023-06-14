import { ID } from "@nestjs/graphql";
import { SortDirection } from "@ptc-org/nestjs-query-core";
import { FilterableField, FilterableRelation, FilterableUnPagedRelation, QueryOptions, UnPagedRelation } from "@ptc-org/nestjs-query-graphql";
import { AfterLoad, BeforeInsert, Column, Index, JoinTable, ManyToMany, ManyToOne, OneToMany } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { generateSku } from "../../../common/helpers/sku-generator.helper";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { BrandEntity } from "../../brand/entities/brand.entity";
import { CategoryEntity } from "../../category/entities/category.entity";
import { ColorEntity } from "../../color/entities/color.entity";
import { CommentEntity } from "../../comment/entities/comment.entity";
import { MediaEntity } from "../../media/entities/media.entity";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";
import { SizeEntity } from "../../size/entities/size.entity";

@Authorize()
@QueryOptions({ filterDepth: 3 })
@FilterableRelation("category", () => CategoryEntity)
@FilterableRelation("brand", () => BrandEntity)
@FilterableUnPagedRelation("productVariants", () => ProductVariantEntity, { defaultSort: [{ field: "createdAt", direction: SortDirection.ASC }] })
@UnPagedRelation("media", () => MediaEntity, { defaultSort: [{ field: "createdAt", direction: SortDirection.ASC }] })
@FilterableUnPagedRelation("comments", () => CommentEntity, { defaultSort: [{ field: "createdAt", direction: SortDirection.DESC }] })
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

  @ManyToOne(() => CategoryEntity)
  category!: CategoryEntity;

  @FilterableField(() => ID)
  @Column()
  brandId!: Id;

  @ManyToOne(() => BrandEntity)
  brand!: BrandEntity;

  @OneToMany(() => ProductVariantEntity, productVariant => productVariant.product, {
    cascade: true,
  })
  productVariants!: ProductVariantEntity[];

  @ManyToMany(() => MediaEntity, {
    eager: true,
    cascade: true,
  })
  @JoinTable({ name: "product_media" })
  media!: MediaEntity[];

  @OneToMany(() => CommentEntity, comments => comments.product)
  comments!: CommentEntity[];

  @AfterLoad()
  private async afterLoad() {
    // console.log("variants", this.productVariants);
    // const variants = await ProductVariantEntity.findBy({ productId: this.id });
    // this.colors = uniqBy(map(variants, "color"), productVariant => productVariant.id)
    //   .sort((p1, p2) => compare(p1.createdAt, p2.createdAt))
    //   .reverse();
    // this.sizes = uniqBy(map(variants, "size"), productVariant => productVariant.id)
    //   .sort((p1, p2) => compare(p1.createdAt, p2.createdAt))
    //   .reverse();
  }

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
