import { FilterableField } from "@nestjs-query/query-graphql";
import { ID, Int } from "@nestjs/graphql";
import { Column, Index, JoinColumn, ManyToOne, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { ColorEntity } from "../../color/entities/color.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { ProductEntity } from "../../product/entities/product.entity";
import { SizeEntity } from "../../size/entities/size.entity";

@FilterableRelation("product", () => ProductEntity)
@FilterableRelation("color", () => ColorEntity)
@FilterableRelation("size", () => SizeEntity)
@FilterableRelation("price", () => PriceEntity)
@ObjectType()
@Index("INX_product_variant_product", ["product"])
@Index("INX_product_variant_color", ["color"])
@Index("INX_product_variant_size", ["size"])
@Entity()
export class ProductVariantEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  productId!: Id;

  @ManyToOne(() => ProductEntity, product => product.productVariants, {
    nullable: false,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  product!: ProductEntity;

  @FilterableField(() => ID)
  @Column()
  colorId!: Id;

  @ManyToOne(() => ColorEntity, {
    nullable: false,
    eager: true,
  })
  color!: ColorEntity;

  @FilterableField(() => ID)
  @Column()
  sizeId!: Id;

  @ManyToOne(() => SizeEntity, {
    nullable: false,
    eager: true,
  })
  size!: SizeEntity;

  @FilterableField(() => ID)
  @Column()
  priceId!: Id;

  @OneToOne(() => PriceEntity, {
    nullable: false,
    eager: true,
    cascade: true,
  })
  @JoinColumn()
  price!: PriceEntity;

  @FilterableField(() => Int)
  @Column({ default: 0 })
  stock!: number;
}
