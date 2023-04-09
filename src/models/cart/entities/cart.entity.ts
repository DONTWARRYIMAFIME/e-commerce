import { SortDirection } from "@nestjs-query/core/dist/src/interfaces/sort-field.interface";
import { FilterableField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { AfterUpdate, BeforeInsert, Column, Index, JoinColumn, OneToMany, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation, UnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { BaseEntity } from "../../base.entity";
import { CartItemEntity } from "../../cart-item/entities/cart-item.entity";
import { PriceEntity } from "../../price/entities/price.entity";
import { UserEntity } from "../../user/entities/user.entity";

@UnPagedRelation("cartItems", () => CartItemEntity, { defaultSort: [{ field: "createdAt", direction: SortDirection.ASC }] })
@FilterableRelation("price", () => PriceEntity)
@FilterableRelation("user", () => UserEntity)
@ObjectType()
@Index("INX_cart_user", ["user"])
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
    this.price = await PriceEntity.create({ amount: 0 });
  }

  @AfterUpdate()
  async s() {
    const count = await PriceEntity.count();
    console.log(count);
  }
}
