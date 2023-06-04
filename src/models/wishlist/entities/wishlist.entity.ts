import { ID } from "@nestjs/graphql";
import { FilterableField, FilterableRelation, FilterableUnPagedRelation } from "@ptc-org/nestjs-query-graphql";
import { Column, Index, JoinColumn, JoinTable, ManyToMany, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { BaseEntity } from "../../base.entity";
import { ProductEntity } from "../../product/entities/product.entity";
import { UserEntity } from "../../user/entities/user.entity";

@Authorize()
@FilterableRelation("user", () => UserEntity)
@FilterableUnPagedRelation("products", () => ProductEntity)
@ObjectType()
@Index("INX_wishlist_user", ["user"])
@Entity()
export class WishlistEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  userId!: string;

  @OneToOne(() => UserEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  user!: UserEntity;

  @ManyToMany(() => ProductEntity, {
    eager: true,
    cascade: true,
  })
  @JoinTable({ name: "wishlist_item" })
  products!: ProductEntity[];
}
