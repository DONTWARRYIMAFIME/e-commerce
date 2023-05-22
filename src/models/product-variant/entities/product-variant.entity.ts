import { FilterableField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { AfterLoad, Column, Index, JoinColumn, ManyToOne, OneToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { ColorEntity } from "../../color/entities/color.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { ProductEntity } from "../../product/entities/product.entity";
import { SizeEntity } from "../../size/entities/size.entity";
import { WarehouseItemEntity } from "../../warehouse-item/entities/warehouse-item.entity";
import { WarehouseStatus } from "../../warehouse/enums/warehouse-status.enum";

@Authorize()
@FilterableRelation("product", () => ProductEntity)
@FilterableRelation("color", () => ColorEntity)
@FilterableRelation("size", () => SizeEntity)
@FilterableRelation("price", () => PriceEntity)
@ObjectType()
@Unique("UNQ_product_variant_sku", ["sku"])
@Index("INX_product_variant_product", ["product"])
@Index("INX_product_variant_color", ["color"])
@Index("INX_product_variant_size", ["size"])
@Entity()
export class ProductVariantEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  sku!: string;

  @FilterableField(() => ID)
  @Column()
  productId!: Id;

  @ManyToOne(() => ProductEntity, product => product.productVariants, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  product!: ProductEntity;

  @FilterableField(() => ID)
  @Column()
  colorId!: Id;

  @ManyToOne(() => ColorEntity, { eager: true })
  color!: ColorEntity;

  @FilterableField(() => ID)
  @Column()
  sizeId!: Id;

  @ManyToOne(() => SizeEntity, { eager: true })
  size!: SizeEntity;

  @FilterableField(() => ID)
  @Column()
  priceId!: Id;

  @OneToOne(() => PriceEntity, {
    eager: true,
    cascade: true,
  })
  @JoinColumn()
  price!: PriceEntity;

  @FilterableField({ defaultValue: 0 })
  stock!: number;

  @AfterLoad()
  private async afterLoad() {
    const stock = await WarehouseItemEntity.sum("available", { productVariantId: this.id, warehouse: { status: WarehouseStatus.ACTIVE } });
    if (stock) {
      this.stock = stock;
    }
  }
}
