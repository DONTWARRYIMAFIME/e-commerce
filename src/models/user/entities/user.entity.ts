import { FilterableField, FilterableRelation, UnPagedRelation } from "@nestjs-query/query-graphql";
import { Field, HideField } from "@nestjs/graphql";
import { hash } from "argon2";
import { AfterLoad, BeforeInsert, BeforeUpdate, Column, JoinColumn, JoinTable, ManyToMany, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { RoleEntity } from "../../../providers/security/authorization/role/entities/role.entity";
import { AddressEntity } from "../../address/entities/address.entity";
import { BaseEntity } from "../../base.entity";
import { CartEntity } from "../../cart/entities/cart.entity";
import { EmailAddressEntity } from "../../email-address/entities/email-address.entity";
import { MediaEntity } from "../../media/entities/media.entity";
import { WishlistEntity } from "../../wishlist/entities/wishlist.entity";

@FilterableRelation("avatar", () => MediaEntity, { nullable: true })
@FilterableRelation("emailAddress", () => EmailAddressEntity)
@FilterableRelation("cart", () => CartEntity, { disableUpdate: true, disableRemove: true })
@FilterableRelation("wishlist", () => WishlistEntity, { disableUpdate: true, disableRemove: true })
@UnPagedRelation("roles", () => RoleEntity, { disableUpdate: true, disableRemove: true })
@UnPagedRelation("addresses", () => AddressEntity, { disableUpdate: true })
@ObjectType()
@Entity()
export class UserEntity extends BaseEntity {
  @OneToOne(() => EmailAddressEntity, {
    eager: true,
    cascade: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  emailAddress!: EmailAddressEntity;

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
