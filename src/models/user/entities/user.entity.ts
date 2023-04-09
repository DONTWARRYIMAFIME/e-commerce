import { FilterableField } from "@nestjs-query/query-graphql";
import { Field, GraphQLISODateTime, HideField, ID } from "@nestjs/graphql";
import { hash } from "argon2";
import { AfterLoad, BeforeInsert, BeforeUpdate, Column, DeleteDateColumn, Index, JoinColumn, JoinTable, ManyToMany, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation, FilterableUnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { AddressEntity } from "../../address/entities/address.entity";
import { BaseEntity } from "../../base.entity";
import { CartEntity } from "../../cart/entities/cart.entity";
import { EmailAddressEntity } from "../../email-address/entities/email-address.entity";
import { MediaEntity } from "../../media/entities/media.entity";
import { RoleEntity } from "../../role/entities/role.entity";
import { WishlistEntity } from "../../wishlist/entities/wishlist.entity";

@FilterableRelation("avatar", () => MediaEntity, { nullable: true })
@FilterableRelation("emailAddress", () => EmailAddressEntity)
@FilterableRelation("cart", () => CartEntity)
@FilterableRelation("wishlist", () => WishlistEntity)
@FilterableUnPagedRelation("roles", () => RoleEntity)
@FilterableUnPagedRelation("addresses", () => AddressEntity)
@ObjectType()
@Index("INX_user_email_address", ["emailAddress"])
@Entity()
export class UserEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  emailAddressId!: Id;

  @OneToOne(() => EmailAddressEntity, {
    eager: true,
    cascade: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  emailAddress!: EmailAddressEntity;

  @FilterableField(() => ID, { nullable: true })
  @Column({ nullable: true })
  avatarId?: Id;

  @OneToOne(() => MediaEntity, {
    nullable: true,
    eager: true,
    onUpdate: "CASCADE",
    onDelete: "SET NULL",
  })
  @JoinColumn()
  avatar?: MediaEntity;

  @FilterableField({ nullable: true })
  @Column({ nullable: true })
  phone?: string;

  @FilterableField({ nullable: true })
  @Column({ length: 64, nullable: true })
  firstName!: string;

  @FilterableField({ nullable: true })
  @Column({ length: 128, nullable: true })
  lastName!: string;

  @Field()
  fullName!: string;

  @HideField()
  @Column()
  password!: string;

  @HideField()
  tempPassword: string;

  @OneToOne(() => CartEntity, cart => cart.user)
  cart!: CartEntity;

  @OneToOne(() => WishlistEntity, wishlist => wishlist.user)
  wishlist!: WishlistEntity;

  @ManyToMany(() => RoleEntity, { eager: true })
  @JoinTable({ name: "user_role" })
  roles!: RoleEntity[];

  @ManyToMany(() => AddressEntity, {
    eager: true,
    cascade: true,
  })
  @JoinTable({ name: "user_address" })
  addresses!: AddressEntity[];

  @FilterableField(() => GraphQLISODateTime, { filterOnly: true })
  @DeleteDateColumn()
  deletedAt?: Date;

  @AfterLoad()
  afterLoad() {
    this.tempPassword = this.password;
    this.fullName = `${this.firstName} ${this.lastName}`;
  }

  @BeforeInsert()
  @BeforeUpdate()
  async beforeInsertOrUpdate() {
    this.fullName = `${this.firstName} ${this.lastName}`;
    if (this.password !== this.tempPassword) {
      this.password = await hash(this.password, { saltLength: 15 });
      this.tempPassword = this.password;
    }
  }
}
