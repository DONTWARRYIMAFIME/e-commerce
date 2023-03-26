import { FilterableField, FilterableRelation, UnPagedRelation } from "@nestjs-query/query-graphql";
import { Field, HideField } from "@nestjs/graphql";
import { Column, JoinColumn, JoinTable, ManyToMany, OneToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { RoleEntity } from "../../../providers/security/authorization/role/entities/role.entity";
import { Roles } from "../../../providers/security/authorization/role/role.enum";
import { BaseEntity } from "../../base.entity";
import { EmailAddressEntity } from "../../email-address/entities/email-address.entity";

@FilterableRelation("emailAddressEntity", () => EmailAddressEntity)
@UnPagedRelation("roleEntities", () => RoleEntity)
@ObjectType()
@Entity()
export class UserEntity extends BaseEntity {
  @FilterableField()
  email: string;

  @HideField()
  @OneToOne(() => EmailAddressEntity, {
    eager: true,
    cascade: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  @JoinColumn()
  emailAddressEntity!: EmailAddressEntity;

  @FilterableField({ nullable: true })
  @Column({ nullable: true })
  phone?: string;

  @FilterableField({ nullable: true })
  @Column({ length: 64, nullable: true })
  firstName?: string;

  @FilterableField({ nullable: true })
  @Column({ length: 128, nullable: true })
  lastName?: string;

  @HideField()
  @Column()
  password!: string;

  @HideField()
  tempPassword: string;

  @Field(() => [Roles])
  roles: Roles[];

  @HideField()
  @ManyToMany(() => RoleEntity, { eager: true })
  @JoinTable({ name: "user_roles" })
  roleEntities!: RoleEntity[];
}
