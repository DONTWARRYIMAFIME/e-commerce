import { FilterableField } from "@nestjs-query/query-graphql";
import { GraphQLISODateTime, ID } from "@nestjs/graphql";
import moment from "moment";
import { AfterLoad, Column, Index, JoinColumn, ManyToOne, OneToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { PaymentIntentEntity } from "../../payment-intent/entities/payment-intent.entity";
import { ProductEntity } from "../../product/entities/product.entity";
import { PromotionEntity } from "../../promotion/entities/promotion.entity";

@Authorize()
@FilterableRelation("product", () => ProductEntity)
@FilterableRelation("promotion", () => PromotionEntity)
@FilterableRelation("paymentIntent", () => PaymentIntentEntity)
@ObjectType()
@Unique("UNQ_promotion_product_product_and_promotion", ["product", "promotion"])
@Index("INX_promotion_product_product", ["product"])
@Index("INX_promotion_product_promotion", ["promotion"])
@Entity()
export class PromotionProductEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  productId!: Id;

  @ManyToOne(() => ProductEntity, {
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  product!: ProductEntity;

  @FilterableField(() => ID)
  @Column()
  promotionId!: Id;

  @ManyToOne(() => PromotionEntity, {
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  promotion!: ProductEntity;

  @OneToOne(() => PaymentIntentEntity, {
    eager: true,
    cascade: true,
  })
  @JoinColumn()
  paymentIntent: PaymentIntentEntity;

  @FilterableField(() => GraphQLISODateTime, { filterOnly: true })
  @Column({ type: "timestamp" })
  expireAt!: Date;

  @FilterableField({ defaultValue: false })
  valid!: boolean;

  @AfterLoad()
  private afterLoad() {
    this.valid = moment(this.expireAt).isAfter();
  }
}
