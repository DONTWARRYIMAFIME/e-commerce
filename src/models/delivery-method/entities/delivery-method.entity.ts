import { FilterableField } from "@nestjs-query/query-graphql";
import { ID, Int } from "@nestjs/graphql";
import { BeforeInsert, BeforeUpdate, Column, Index, ManyToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { DeliveryMethodStatusEntity } from "../../delivery-method-status/entities/delivery-method-status.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { DeliveryMethod } from "../enums/delivery-method.enum";

@FilterableRelation("status", () => DeliveryMethodStatusEntity)
@FilterableRelation("price", () => PriceEntity)
@ObjectType()
@Unique("UNQ_delivery_method_code", ["code"])
@Index("INX_delivery_method_status", ["status"])
@Entity()
export class DeliveryMethodEntity extends BaseEntity {
  @FilterableField()
  @Column({
    type: "enum",
    enum: DeliveryMethod,
  })
  code!: DeliveryMethod;

  @FilterableField()
  @Column({ length: 64 })
  name!: string;

  @FilterableField(() => ID)
  @Column()
  statusId: Id;

  @ManyToOne(() => DeliveryMethodStatusEntity, { eager: true })
  status!: DeliveryMethodStatusEntity;

  @FilterableField(() => ID)
  @Column()
  priceId: Id;

  @ManyToOne(() => PriceEntity, { cascade: true })
  price!: PriceEntity;

  // TODO: implement logic that gonna listen orderComplete event and calculate delivery time
  @FilterableField(() => Int, { nullable: true })
  @Column({ type: "int", unsigned: true, nullable: true })
  avgDeliveryTimeInHours!: number;

  @BeforeInsert()
  @BeforeUpdate()
  private async beforeInsertOrUpdate() {
    if (!this.statusId) {
      this.status = await DeliveryMethodStatusEntity.findOneByOrFail({ isDefault: true });
    }
  }
}
