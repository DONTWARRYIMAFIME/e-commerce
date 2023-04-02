import { FilterableField, FilterableRelation, UnPagedRelation } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { BeforeInsert, BeforeUpdate, Column, Index, ManyToOne, OneToMany, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { WarehouseItemEntity } from "../../warehouse-item/entities/warehouse-item.entity";
import { WarehouseStatusEntity } from "../../warehouse-status/entities/warehouse-status.entity";

@FilterableRelation("status", () => WarehouseStatusEntity)
@UnPagedRelation("warehouseItems", () => WarehouseItemEntity)
@ObjectType()
@Unique("UNQ_warehouse_code", ["code"])
@Index("INX_warehouse_status", ["status"])
@Entity()
export class WarehouseEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 4 })
  code!: string;

  @FilterableField()
  @Column({ length: 32 })
  name!: string;

  @FilterableField(() => ID)
  @Column()
  statusId!: Id;

  @ManyToOne(() => WarehouseStatusEntity, { eager: true })
  status!: WarehouseStatusEntity;

  @OneToMany(() => WarehouseItemEntity, warehouseItem => warehouseItem.warehouse, { cascade: true })
  warehouseItems!: WarehouseItemEntity[];

  @BeforeInsert()
  @BeforeUpdate()
  private async beforeInsertOrUpdate() {
    // If currency isn't specified use default one
    if (!this.statusId) {
      this.status = await WarehouseStatusEntity.findOneBy({ isDefault: true });
    }
  }
}
