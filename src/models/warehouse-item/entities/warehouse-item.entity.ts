import { FilterableField } from "@nestjs-query/query-graphql";
import { ID, Int } from "@nestjs/graphql";
import { max } from "lodash";
import { BeforeInsert, BeforeUpdate, Column, Index, ManyToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";
import { WarehouseEntity } from "../../warehouse/entities/warehouse.entity";

@Authorize()
@FilterableRelation("productVariant", () => ProductVariantEntity)
@ObjectType()
@Unique("UNQ_warehouse_item_warehouse_and_product_variant", ["warehouse", "productVariant"])
@Index("INX_warehouse_item_warehouse", ["warehouse"])
@Index("INX_warehouse_item_productVariant", ["productVariant"])
@Entity()
export class WarehouseItemEntity extends BaseEntity {
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
  productVariantId!: Id;

  @ManyToOne(() => ProductVariantEntity, {
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  productVariant!: ProductVariantEntity;

  @FilterableField(() => Int)
  @Column({ type: "int", unsigned: true, default: 0 })
  stock!: number;

  @FilterableField(() => Int)
  @Column({ type: "int", unsigned: true, default: 0 })
  reserved!: number;

  @FilterableField(() => Int)
  @Column({ type: "int", unsigned: true, default: 0 })
  available!: number;

  @BeforeInsert()
  @BeforeUpdate()
  private beforeInsertOrUpdate() {
    this.available = this.stock - max([this.reserved, 0]);
  }
}
