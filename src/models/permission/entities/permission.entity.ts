import { FilterableField } from "@nestjs-query/query-graphql";
import { Context, Field } from "@nestjs/graphql";
import GraphQLJSON from "graphql-type-json";
import { AfterLoad, Column, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { Actions } from "../../../providers/security/casl/actions.enum";
import { PermissionCondition } from "../../../providers/security/casl/interfaces/authorizable-user.interface";
import { BaseEntity } from "../../base.entity";

@Authorize()
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
  async afterLoad(@Context() context) {
    console.log(context);
  }

  /**
   * @param condition: {"departmentId": "{{id}}"}
   * @param variables: {"id: 1"}
   * @return condition after parse: {"departmentId": 1}
   */
  public static parseCondition(condition: PermissionCondition, variables: Record<string, any>): PermissionCondition {
    if (!condition) return null;
    const parsedCondition = {};
    for (const [key, rawValue] of Object.entries(condition)) {
      if (rawValue !== null && typeof rawValue === "object") {
        parsedCondition[key] = this.parseCondition(rawValue, variables);
        continue;
      }
      if (typeof rawValue !== "string") {
        parsedCondition[key] = rawValue;
        continue;
      }
      // find placeholder "{{...}}"
      const matches = /{{([a-zA-Z0-9]+)}}/.exec(rawValue);
      if (!matches) {
        parsedCondition[key] = rawValue;
        continue;
      }
      const value = variables[matches[1]];
      if (typeof value === "undefined") {
        throw new ReferenceError(`Variable ${key} is not defined`);
      }
      parsedCondition[key] = value;
    }
    return parsedCondition;
  }
}
