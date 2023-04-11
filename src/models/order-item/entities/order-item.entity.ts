import { FilterableField } from "@nestjs-query/query-graphql";
import { ID, Int } from "@nestjs/graphql";
import { Column, Index, JoinColumn, ManyToOne, OneToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { OrderEntity } from "../../order/entities/order.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";
import { WarehouseEntity } from "../../warehouse/entities/warehouse.entity";

@Authorize()
@FilterableRelation("order", () => OrderEntity)
@FilterableRelation("productVariant", () => ProductVariantEntity)
@FilterableRelation("warehouse", () => WarehouseEntity)
@FilterableRelation("price", () => PriceEntity)
@ObjectType()
@Unique("UNQ_order_item_order_product_variant_warehouse", ["order", "productVariant", "warehouse"])
@Index("INX_order_item_order", ["order"])
@Index("INX_order_item_product_variant", ["productVariant"])
@Index("INX_order_item_warehouse", ["warehouse"])
@Entity()
export class OrderItemEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  orderId!: Id;

  @ManyToOne(() => OrderEntity, order => order.orderItems, {
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  order!: OrderEntity;

  @FilterableField(() => ID)
  @Column()
  productVariantId!: Id;

  @ManyToOne(() => ProductVariantEntity, {
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  productVariant!: ProductVariantEntity;

  @FilterableField(() => ID)
  @Column()
  warehouseId!: Id;

  @ManyToOne(() => WarehouseEntity, {
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  warehouse!: WarehouseEntity;

  @FilterableField(() => ID)
  @Column()
  priceId!: Id;

  @OneToOne(() => PriceEntity, {
    eager: true,
    cascade: true,
  })
  @JoinColumn()
  price!: PriceEntity;

  @FilterableField(() => Int)
  @Column({ type: "int", unsigned: true })
  quantity!: number;
}
