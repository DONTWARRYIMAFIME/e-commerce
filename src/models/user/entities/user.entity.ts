import { Field, GraphQLISODateTime, HideField, ID } from "@nestjs/graphql";
import { FilterableField, FilterableRelation, FilterableUnPagedRelation } from "@ptc-org/nestjs-query-graphql";
import { hash } from "argon2";
import { map } from "lodash";
import { AfterInsert, AfterLoad, AfterUpdate, BeforeInsert, BeforeUpdate, Column, DeleteDateColumn, Index, JoinColumn, JoinTable, ManyToMany, OneToMany, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { BrandEntity } from "../../brand/entities/brand.entity";
import { CartEntity } from "../../cart/entities/cart.entity";
import { EmailAddressEntity } from "../../email-address/entities/email-address.entity";
import { MediaEntity } from "../../media/entities/media.entity";
import { PermissionEntity } from "../../permission/entities/permission.entity";
import { RoleEntity } from "../../role/entities/role.entity";
import { UserAddressEntity } from "../../user-address/entities/user-address.entity";
import { WishlistEntity } from "../../wishlist/entities/wishlist.entity";

@FilterableRelation("avatar", () => MediaEntity, { nullable: true })
@FilterableRelation("emailAddress", () => EmailAddressEntity)
@FilterableRelation("cart", () => CartEntity)
@FilterableRelation("wishlist", () => WishlistEntity)
@FilterableUnPagedRelation("userAddresses", () => UserAddressEntity)
@FilterableUnPagedRelation("brands", () => BrandEntity)
@FilterableUnPagedRelation("roles", () => RoleEntity)
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

  @Field(() => [PermissionEntity])
  permissions!: PermissionEntity[];

  @OneToMany(() => UserAddressEntity, userAddresses => userAddresses.user, {
    eager: true,
    cascade: true,
  })
  userAddresses?: UserAddressEntity[];

  @OneToMany(() => BrandEntity, brands => brands.user, { eager: true })
  brands?: BrandEntity[];

  @FilterableField(() => GraphQLISODateTime, { filterOnly: true })
  @DeleteDateColumn()
  deletedAt?: Date;

  @AfterLoad()
  private afterLoad() {
    this.tempPassword = this.password;
    this.fullName = `${this.firstName} ${this.lastName}`;

    this.loadPermissions();
  }

  @BeforeInsert()
  @BeforeUpdate()
  private async beforeInsertOrUpdate() {
    this.fullName = `${this.firstName} ${this.lastName}`;
    if (this.password !== this.tempPassword) {
      this.password = await hash(this.password, { saltLength: 15 });
      this.tempPassword = this.password;
    }
  }

  @AfterInsert()
  @AfterUpdate()
  private async afterInsertOrUpdate() {
    this.loadPermissions();
  }

  private loadPermissions() {
    this.permissions = this.roles?.flatMap(role => {
      return role.permissions?.map(permission => {
        return {
          ...permission,
          conditions: PermissionEntity.parseCondition(permission.conditions, { userId: this.id, brandIds: map(this.brands, "id") }),
        } as PermissionEntity;
      });
    });
  }
}
