import { FilterableField } from "@nestjs-query/query-graphql";
import { ID, Int } from "@nestjs/graphql";
import { Column, Index, JoinColumn, ManyToOne, OneToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { CartEntity } from "../../cart/entities/cart.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";

@Authorize()
@FilterableRelation("productVariant", () => ProductVariantEntity)
@FilterableRelation("price", () => PriceEntity)
@ObjectType()
@Unique("UNQ_cart_product_variant", ["cart", "productVariant"])
@Index("INX_cart_item_cart", ["cart"])
@Index("INX_cart_item_product_variant", ["productVariant"])
@Entity()
export class CartItemEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  cartId!: Id;

  @ManyToOne(() => CartEntity, cart => cart.cartItems, {
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  cart!: CartEntity;

  @FilterableField(() => ID)
  @Column()
  productVariantId!: Id;

  @ManyToOne(() => ProductVariantEntity, {
    eager: true,
    cascade: true,
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  productVariant!: ProductVariantEntity;

  @FilterableField(() => Int)
  @Column({ type: "int", unsigned: true })
  quantity!: number;

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
}
