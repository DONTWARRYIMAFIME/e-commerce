import { FilterableField, FilterableRelation } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { BeforeInsert, BeforeUpdate, Column, Index, ManyToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { WarehouseStatusEntity } from "../../warehouse-status/entities/warehouse-status.entity";

@FilterableRelation("status", () => WarehouseStatusEntity)
@ObjectType()
@Unique("UNQ_warehouse_code", ["code"])
@Index("INX_warehouse_status_id", ["statusId"])
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

  @BeforeInsert()
  @BeforeUpdate()
  private async beforeInsertOrUpdate() {
    // If currency isn't specified use default one
    if (!this.statusId) {
      this.status = await WarehouseStatusEntity.findOneBy({ isDefault: true });
    }
  }
}
