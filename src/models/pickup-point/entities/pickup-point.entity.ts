import { FilterableField, IDField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { Column, Index, JoinColumn, OneToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { AddressEntity } from "../../address/entities/address.entity";
import { BaseEntity } from "../../base.entity";
import { PickupPointStatus } from "../enums/pickup-point-status.enum";

@FilterableRelation("address", () => AddressEntity)
@ObjectType()
@Unique("UNQ_pickup_point_code", ["code"])
@Index("INX_pickup_point_status", ["status"])
@Entity()
export class PickupPointEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 6 })
  code!: string;

  @FilterableField()
  @Column({ length: 128 })
  name!: string;

  @IDField(() => ID)
  @Column()
  addressId!: Id;

  @FilterableField()
  @Column({
    type: "enum",
    enum: PickupPointStatus,
    default: PickupPointStatus.ACTIVE,
  })
  status!: PickupPointStatus;

  @OneToOne(() => AddressEntity, {
    eager: true,
    cascade: true,
  })
  @JoinColumn()
  address!: AddressEntity;
}
