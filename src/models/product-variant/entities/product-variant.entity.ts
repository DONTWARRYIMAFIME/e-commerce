import { IDField } from "@nestjs-query/query-graphql";
import { HideField, ID } from "@nestjs/graphql";
import { Column, Index, JoinColumn, ManyToOne, OneToMany, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { ColorEntity } from "../../color/entities/color.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { ProductEntity } from "../../product/entities/product.entity";
import { WarehouseItemEntity } from "../../warehouse-item/entities/warehouse-item.entity";

@FilterableRelation("product", () => ProductEntity)
@FilterableRelation("price", () => PriceEntity)
@FilterableRelation("color", () => ColorEntity)
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
    onUpdate: "CASCADE",
    onDelete: "SET NULL",
  })
  @JoinColumn()
  price!: PriceEntity;

  @IDField(() => ID)
  @Column()
  colorId!: Id;

  @ManyToOne(() => ColorEntity, {
    onUpdate: "CASCADE",
    onDelete: "SET NULL",
  })
  color!: ColorEntity;

  @HideField()
  @OneToMany(() => WarehouseItemEntity, warehouseProductVariants => warehouseProductVariants.productVariant, { cascade: true })
  warehouseItems!: WarehouseItemEntity[];
}
