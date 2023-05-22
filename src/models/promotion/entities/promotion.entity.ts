import { FilterableField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { Column, JoinColumn, OneToMany, OneToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { FilterableRelation, FilterableUnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { ProductEntity } from "../../product/entities/product.entity";
import { PromotionProductEntity } from "../../promotion-product/entities/promotion-product.entity";

@Authorize()
@FilterableRelation("price", () => PriceEntity)
@FilterableUnPagedRelation("products", () => PromotionProductEntity)
@ObjectType()
@Unique("UNQ_promotion_code", ["code"])
@Entity()
export class PromotionEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 128 })
  code!: string;

  @FilterableField()
  @Column({ length: 256 })
  name!: string;

  @FilterableField(() => ID)
  @Column()
  priceId!: Id;

  @OneToOne(() => PriceEntity, {
    eager: true,
    cascade: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  price!: PriceEntity;

  @OneToMany(() => PromotionProductEntity, promotionProduct => promotionProduct.promotionId)
  products!: ProductEntity[];
}
