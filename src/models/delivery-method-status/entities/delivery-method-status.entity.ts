import { FilterableField } from "@nestjs-query/query-graphql";
import { Column, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { DeliveryMethodStatus } from "../enums/delivery-method-status.enum";

@ObjectType()
@Unique("UNQ_delivery_method_status_code", ["code"])
@Entity()
export class DeliveryMethodStatusEntity extends BaseEntity {
  @FilterableField()
  @Column({
    type: "enum",
    enum: DeliveryMethodStatus,
  })
  code!: DeliveryMethodStatus;

  @FilterableField()
  @Column({ length: 64 })
  name!: string;

  @FilterableField()
  @Column({ default: false })
  isDefault!: boolean;
}
