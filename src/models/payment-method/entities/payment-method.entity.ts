import { FilterableField, FilterableRelation } from "@ptc-org/nestjs-query-graphql";
import { Column, JoinColumn, OneToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { BaseEntity } from "../../base.entity";
import { MediaEntity } from "../../media/entities/media.entity";
import { PaymentMethodStatus } from "../enums/payment-method-status.enum";
import { PaymentMethods } from "../enums/payment-methods.enum";

@Authorize()
@FilterableRelation("media", () => MediaEntity, { nullable: true })
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
  @Column({ default: false })
  online!: boolean;

  @FilterableField()
  @Column({ length: 128 })
  name!: string;

  @FilterableField({ nullable: true })
  @Column({ nullable: true, type: "text" })
  description!: string;

  @OneToOne(() => MediaEntity, {
    nullable: true,
    eager: true,
    cascade: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  media?: MediaEntity;

  @FilterableField(() => PaymentMethodStatus)
  @Column({
    type: "enum",
    enum: PaymentMethodStatus,
    default: PaymentMethodStatus.ACTIVE,
  })
  status!: PaymentMethodStatus;
}
