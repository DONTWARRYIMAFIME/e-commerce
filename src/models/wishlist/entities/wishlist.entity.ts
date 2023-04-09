import { FilterableField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { Column, Index, JoinColumn, JoinTable, ManyToMany, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation, FilterableUnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { BaseEntity } from "../../base.entity";
import { ProductEntity } from "../../product/entities/product.entity";
import { UserEntity } from "../../user/entities/user.entity";

@FilterableRelation("user", () => UserEntity)
@FilterableUnPagedRelation("products", () => ProductEntity, { disableUpdate: false, disableRemove: false })
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
