import { FilterableField } from "@nestjs-query/query-graphql";
import { Column, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../../../common/decorators";
import { BaseEntity } from "../../../../../models/base.entity";
import { Roles } from "../role.enum";

@ObjectType()
@Unique("UNQ_role_name", ["name"])
@Entity()
export class RoleEntity extends BaseEntity {
  @FilterableField(() => Roles)
  @Column({
    type: "enum",
    enum: Roles,
  })
  name!: Roles;
}
