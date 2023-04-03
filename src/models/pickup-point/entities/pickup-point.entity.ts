import { FilterableField, IDField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { Column, JoinColumn, OneToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { AddressEntity } from "../../address/entities/address.entity";
import { BaseEntity } from "../../base.entity";

@FilterableRelation("address", () => AddressEntity)
@ObjectType()
@Unique("UNQ_pickup_point_code", ["code"])
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

  @OneToOne(() => AddressEntity, {
    eager: true,
    cascade: true,
  })
  @JoinColumn()
  address!: AddressEntity;
}
