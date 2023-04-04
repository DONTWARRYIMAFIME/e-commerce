import { FilterableField, IDField } from "@nestjs-query/query-graphql";
import { ID, Int } from "@nestjs/graphql";
import { Column, Index, JoinColumn, JoinTable, ManyToMany, ManyToOne, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation, UnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { ColorEntity } from "../../color/entities/color.entity";
import { MediaEntity } from "../../media/entities/media.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { ProductEntity } from "../../product/entities/product.entity";
import { SizeEntity } from "../../size/entities/size.entity";

@FilterableRelation("product", () => ProductEntity)
@FilterableRelation("price", () => PriceEntity)
@FilterableRelation("color", () => ColorEntity)
@UnPagedRelation("sizes", () => SizeEntity)
@UnPagedRelation("media", () => MediaEntity)
@ObjectType()
@Index("INX_product_variant_product", ["product"])
@Index("INX_product_variant_color", ["color"])
@Entity()
export class ProductVariantEntity extends BaseEntity {
  @IDField(() => ID)
  @Column()
  productId!: Id;

  @ManyToOne(() => ProductEntity, product => product.productVariants, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  product!: ProductEntity;

  @IDField(() => ID)
  @Column()
  priceId!: Id;

  @OneToOne(() => PriceEntity, {
    eager: true,
    cascade: true,
  })
  @JoinColumn()
  price!: PriceEntity;

  @IDField(() => ID)
  @Column()
  colorId!: Id;

  @ManyToOne(() => ColorEntity, {
    eager: true,
    cascade: true,
  })
  color!: ColorEntity;

  @ManyToMany(() => SizeEntity, {
    eager: true,
    cascade: true,
  })
  @JoinTable({ name: "product_variant_size" })
  sizes!: SizeEntity[];

  @ManyToMany(() => MediaEntity, {
    eager: true,
    cascade: true,
  })
  @JoinTable({ name: "product_variant_media" })
  media!: MediaEntity[];

  @FilterableField(() => Int)
  @Column({ default: 0 })
  stock!: number;
}
