import { ID } from "@nestjs/graphql";
import { FilterableField, FilterableRelation } from "@ptc-org/nestjs-query-graphql";
import { Column, Index, ManyToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { OrderStatus } from "../enums/order-status.enum";
import { OrderEntity } from "./order.entity";

@FilterableRelation("order", () => OrderEntity)
@ObjectType()
@Index("INX_order_history_order", ["order"])
@Index("INX_order_history_status", ["status"])
@Entity()
export class OrderHistoryEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  orderId!: Id;

  @ManyToOne(() => OrderEntity, order => order.orderHistories, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  order!: OrderEntity;

  @FilterableField(() => OrderStatus)
  @Column({
    type: "enum",
    enum: OrderStatus,
  })
  status!: OrderStatus;
}
