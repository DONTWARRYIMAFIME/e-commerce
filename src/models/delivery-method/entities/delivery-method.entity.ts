import { FilterableField } from "@nestjs-query/query-graphql";
import { ID, Int } from "@nestjs/graphql";
import { Column, Index, ManyToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { DeliveryMethodStatus } from "../enums/delivery-method-status.enum";
import { DeliveryMethodTypes } from "../enums/delivery-method-type";
import { DeliveryMethods } from "../enums/delivery-method.enum";

@Authorize()
@FilterableRelation("price", () => PriceEntity)
@ObjectType()
@Unique("UNQ_delivery_method_code", ["code"])
@Index("INX_delivery_method_status", ["status"])
@Entity()
export class DeliveryMethodEntity extends BaseEntity {
  @FilterableField()
  @Column({
    type: "enum",
    enum: DeliveryMethods,
  })
  code!: DeliveryMethods;

  @FilterableField()
  @Column({ length: 64 })
  name!: string;

  @FilterableField()
  @Column({
    type: "enum",
    enum: DeliveryMethodTypes,
    default: DeliveryMethodTypes.HOME_DELIVERY,
  })
  type!: DeliveryMethodTypes;

  @FilterableField(() => DeliveryMethodStatus)
  @Column({
    type: "enum",
    enum: DeliveryMethodStatus,
    default: DeliveryMethodStatus.ACTIVE,
  })
  status!: DeliveryMethodStatus;

  @FilterableField(() => ID)
  @Column()
  priceId: Id;

  @ManyToOne(() => PriceEntity, {
    eager: true,
    cascade: true,
  })
  price!: PriceEntity;

  // TODO: implement logic that gonna listen orderComplete event and calculate delivery time
  @FilterableField(() => Int, { nullable: true })
  @Column({ type: "int", unsigned: true, nullable: true })
  avgDeliveryTimeInHours!: number;
}
