import { FilterableField, FilterableRelation } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { Column, Index, JoinColumn, ManyToOne, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { ColorEntity } from "../../color/entities/color.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { ProductEntity } from "../../product/entities/product.entity";

@FilterableRelation("product", () => ProductEntity)
@FilterableRelation("price", () => PriceEntity)
@FilterableRelation("color", () => ColorEntity)
@ObjectType()
@Index("INX_product_variant_product_id", ["productId"])
@Index("INX_product_variant_color_id", ["colorId"])
@Entity()
export class ProductVariantEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  productId!: Id;

  @ManyToOne(() => ProductEntity, product => product.productVariants, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  product!: ProductEntity;

  @OneToOne(() => PriceEntity, {
    eager: true,
    cascade: true,
    onUpdate: "CASCADE",
    onDelete: "SET NULL",
  })
  @JoinColumn()
  price!: PriceEntity;

  @FilterableField(() => ID)
  @Column()
  colorId!: Id;

  @ManyToOne(() => ColorEntity, {
    onUpdate: "CASCADE",
    onDelete: "SET NULL",
  })
  color!: ColorEntity;
}
