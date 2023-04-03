import { FilterableRelation, IDField, UnPagedRelation } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { Column, Index, JoinColumn, JoinTable, ManyToMany, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";
import { ProductVariantEntity } from "../../product-variant/entities/product-variant.entity";
import { UserEntity } from "../../user/entities/user.entity";

@FilterableRelation("user", () => UserEntity, { disableUpdate: true, disableRemove: true })
@UnPagedRelation("productVariants", () => ProductVariantEntity)
@ObjectType()
@Index("INX_wishlist_user", ["user"])
@Entity()
export class WishlistEntity extends BaseEntity {
  @IDField(() => ID)
  @Column()
  userId!: string;

  @OneToOne(() => UserEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  user!: UserEntity;

  @ManyToMany(() => ProductVariantEntity, {
    eager: true,
    cascade: true,
  })
  @JoinTable({ name: "wishlist_item" })
  productVariants!: ProductVariantEntity[];
}
