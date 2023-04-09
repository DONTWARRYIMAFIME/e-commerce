import { FilterableField } from "@nestjs-query/query-graphql";
import { Column, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { PaymentMethodStatus } from "../enums/payment-method-status.enum";
import { PaymentMethods } from "../enums/payment-methods.enum";

@ObjectType()
@Unique("UNQ_payment_method_code", ["code"])
@Entity()
export class PaymentMethodEntity extends BaseEntity {
  @FilterableField(() => PaymentMethods)
  @Column({
    type: "enum",
    enum: PaymentMethods,
  })
  code!: PaymentMethods;

  @FilterableField()
  @Column({ length: 128 })
  name!: string;

  @FilterableField(() => PaymentMethodStatus)
  @Column({
    type: "enum",
    enum: PaymentMethodStatus,
    default: PaymentMethodStatus.ACTIVE,
  })
  status!: PaymentMethodStatus;
}
