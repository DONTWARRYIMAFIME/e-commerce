import { SortDirection } from "@nestjs-query/core/dist/src/interfaces/sort-field.interface";
import { FilterableField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { BeforeInsert, Column, Index, JoinColumn, ManyToOne, OneToMany, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { FilterableRelation, FilterableUnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { AddressEntity } from "../../address/entities/address.entity";
import { BaseEntity } from "../../base.entity";
import { CartItemEntity } from "../../cart-item/entities/cart-item.entity";
import { DeliveryMethodEntity } from "../../delivery-method/entities/delivery-method.entity";
import { PaymentMethodEntity } from "../../payment-method/entities/payment-method.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { UserEntity } from "../../user/entities/user.entity";

@Authorize()
@FilterableRelation("user", () => UserEntity)
@FilterableRelation("paymentMethod", () => PaymentMethodEntity, { nullable: true })
@FilterableRelation("deliveryMethod", () => DeliveryMethodEntity, { nullable: true })
@FilterableRelation("deliveryAddress", () => AddressEntity, { nullable: true })
@FilterableRelation("subtotalPrice", () => PriceEntity)
@FilterableRelation("taxPrice", () => PriceEntity)
@FilterableRelation("deliveryPrice", () => PriceEntity)
@FilterableRelation("totalPrice", () => PriceEntity)
@FilterableUnPagedRelation("cartItems", () => CartItemEntity, { defaultSort: [{ field: "createdAt", direction: SortDirection.ASC }] })
@ObjectType()
@Index("INX_cart_user", ["user"])
@Index("INX_delivery_address", ["deliveryAddress"])
@Index("INX_delivery_method", ["deliveryMethod"])
@Index("INX_payment_method", ["paymentMethod"])
@Entity()
export class CartEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  userId!: string;

  @OneToOne(() => UserEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  user!: UserEntity;

  @FilterableField(() => ID, { nullable: true })
  @Column({ nullable: true })
  paymentMethodId!: Id;

  @ManyToOne(() => PaymentMethodEntity)
  paymentMethod!: PaymentMethodEntity;

  @FilterableField(() => ID, { nullable: true })
  @Column({ nullable: true })
  deliveryMethodId!: Id;

  @ManyToOne(() => DeliveryMethodEntity)
  deliveryMethod!: DeliveryMethodEntity;

  @FilterableField(() => ID, { nullable: true })
  @Column({ nullable: true })
  deliveryAddressId!: Id;

  @ManyToOne(() => AddressEntity)
  deliveryAddress!: AddressEntity;

  @FilterableField(() => ID)
  @Column()
  subtotalPriceId!: Id;

  @OneToOne(() => PriceEntity, {
    eager: true,
    cascade: true,
  })
  @JoinColumn()
  subtotalPrice!: PriceEntity;

  @FilterableField(() => ID)
  @Column()
  taxPriceId!: Id;

  @OneToOne(() => PriceEntity, {
    eager: true,
    cascade: true,
  })
  @JoinColumn()
  taxPrice!: PriceEntity;

  @FilterableField(() => ID)
  @Column()
  deliveryPriceId!: Id;

  @OneToOne(() => PriceEntity, {
    eager: true,
    cascade: true,
  })
  @JoinColumn()
  deliveryPrice!: PriceEntity;

  @FilterableField(() => ID)
  @Column()
  totalPriceId!: Id;

  @OneToOne(() => PriceEntity, {
    eager: true,
    cascade: true,
  })
  @JoinColumn()
  totalPrice!: PriceEntity;

  @FilterableField()
  @Column({ default: 0 })
  quantity!: number;

  @OneToMany(() => CartItemEntity, cartProductVariants => cartProductVariants.cart, {
    eager: true,
    cascade: true,
    onUpdate: "CASCADE",
  })
  cartItems!: CartItemEntity[];

  @BeforeInsert()
  async beforeInsert() {
    this.subtotalPrice = await PriceEntity.create({ amount: 0 });
    this.taxPrice = await PriceEntity.create({ amount: 0 });
    this.deliveryPrice = await PriceEntity.create({ amount: 0 });
    this.totalPrice = await PriceEntity.create({ amount: 0 });

    await PriceEntity.save([this.subtotalPrice, this.taxPrice, this.deliveryPrice, this.totalPrice]);
  }
}
