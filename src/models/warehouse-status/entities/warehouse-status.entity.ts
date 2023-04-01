import { FilterableField } from "@nestjs-query/query-graphql";
import { Column, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { WarehouseStatus } from "../enum/warehouse-status.enum";

@ObjectType()
@Unique("UNQ_warehouse_status_code", ["code"])
@Entity()
export class WarehouseStatusEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 64 })
  code!: WarehouseStatus;

  @FilterableField()
  @Column({ length: 64 })
  name!: string;

  @FilterableField()
  @Column({ default: false })
  isDefault!: boolean;
}
