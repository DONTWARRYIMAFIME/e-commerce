import { FilterableField, FilterableRelation, IDField } from "@nestjs-query/query-graphql";
import { ID, Int } from "@nestjs/graphql";
import { max } from "lodash";
import { BeforeInsert, BeforeUpdate, Column, ManyToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";
import { WarehouseEntity } from "../../warehouse/entities/warehouse.entity";

@FilterableRelation("productVariant", () => ProductVariantEntity, { disableUpdate: true, disableRemove: true })
@ObjectType()
@Unique("UNQ_warehouse_item_warehouse_and_product_variant", ["warehouse", "productVariant"])
@Entity()
export class WarehouseItemEntity extends BaseEntity {
  @IDField(() => ID)
  @Column()
  warehouseId!: string;

  @ManyToOne(() => WarehouseEntity, {
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  warehouse!: WarehouseEntity;

  @IDField(() => ID)
  @Column()
  productVariantId!: string;

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
