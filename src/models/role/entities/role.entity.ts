import { FilterableField } from "@nestjs-query/query-graphql";
import { Column, JoinTable, ManyToMany, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableUnPagedRelation } from "../../../common/decorators/graphql/relation.decorator";
import { BaseEntity } from "../../base.entity";
import { PermissionEntity } from "../../permission/entities/permission.entity";
import { Roles } from "../enums/roles.enum";

@FilterableUnPagedRelation("permissions", () => PermissionEntity)
@ObjectType()
@Unique("UNQ_role_code", ["code"])
@Entity()
export class RoleEntity extends BaseEntity {
  @FilterableField(() => Roles)
  @Column({
    type: "enum",
    enum: Roles,
  })
  code!: Roles;

  @FilterableField()
  @Column({ length: 128 })
  name!: string;

  @ManyToMany(() => PermissionEntity, {
    eager: true,
    cascade: true,
  })
  @JoinTable({ name: "role_permission" })
  permissions!: PermissionEntity[];
}
