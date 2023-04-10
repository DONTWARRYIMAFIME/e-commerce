import { FilterableField } from "@nestjs-query/query-graphql";
import { Field } from "@nestjs/graphql";
import GraphQLJSON from "graphql-type-json";
import { AfterLoad, Column, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Actions } from "../../../providers/security/casl/actions.enum";
import { PermissionCondition } from "../../../providers/security/casl/interfaces/authorizable-user.interface";
import { BaseEntity } from "../../base.entity";

@ObjectType()
@Unique("UNQ_permission_action_subject_conditions", ["action", "subject", "conditions"])
@Entity()
export class PermissionEntity extends BaseEntity {
  @Field(() => Actions)
  @Column({
    type: "enum",
    enum: Actions,
  })
  action!: Actions;

  @FilterableField()
  @Column({ length: 128 })
  subject!: string;

  @FilterableField(() => GraphQLJSON, { nullable: true })
  @Column({ type: "jsonb", nullable: true })
  conditions!: PermissionCondition;

  @AfterLoad()
  async afterLoad() {
    console.log(this);
  }
}
