import { SortDirection } from "@nestjs-query/core/dist/src/interfaces/sort-field.interface";
import { FilterableField, FilterableRelation, IDField, UnPagedRelation } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { BeforeInsert, Column, Index, JoinColumn, OneToMany, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { CartItemEntity } from "../../cart-item/entities/cart-item.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { UserEntity } from "../../user/entities/user.entity";

@UnPagedRelation("cartItems", () => CartItemEntity, { defaultSort: [{ field: "createdAt", direction: SortDirection.ASC }], disableUpdate: true, disableRemove: true })
@FilterableRelation("price", () => PriceEntity, { disableUpdate: true, disableRemove: true })
@FilterableRelation("user", () => UserEntity, { disableUpdate: true, disableRemove: true })
@ObjectType()
@Index("INX_cart_price", ["price"])
@Entity()
export class CartEntity extends BaseEntity {
  @IDField(() => ID)
  @Column()
  userId!: string;

  @OneToOne(() => UserEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  user!: UserEntity;

  @OneToOne(() => PriceEntity, {
    eager: true,
    cascade: true,
    onUpdate: "CASCADE",
  })
  @JoinColumn()
  price!: PriceEntity;

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
    const price = await PriceEntity.create({ amount: 0 });
    this.price = await PriceEntity.save(price);
  }
}
