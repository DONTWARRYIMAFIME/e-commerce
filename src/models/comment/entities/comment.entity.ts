import { FilterableField } from "@nestjs-query/query-graphql";
import { Float, ID } from "@nestjs/graphql";
import { Column, Index, JoinTable, ManyToMany, ManyToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation, FilterableUnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { MediaEntity } from "../../media/entities/media.entity";
import { ProductEntity } from "../../product/entities/product.entity";
import { UserEntity } from "../../user/entities/user.entity";

@FilterableRelation("user", () => UserEntity)
@FilterableRelation("product", () => ProductEntity)
@FilterableUnPagedRelation("media", () => MediaEntity)
@ObjectType()
@Index("INX_comment_user", ["user"])
@Index("INX_comment_product", ["product"])
@Entity()
export class CommentEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  userId!: Id;

  @ManyToOne(() => UserEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  user!: UserEntity;

  @FilterableField(() => ID)
  @Column()
  productId!: Id;

  @ManyToOne(() => ProductEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  product!: ProductEntity;

  @FilterableField({ nullable: true })
  @Column({ type: "text", nullable: true })
  description?: string;

  @FilterableField(() => Float)
  @Column({ type: "float" })
  rating!: number;

  @ManyToMany(() => MediaEntity)
  @JoinTable({ name: "comment_media" })
  media?: MediaEntity[];
}
