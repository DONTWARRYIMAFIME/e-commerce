import { Field, InputType } from "@nestjs/graphql";
import { IsObject, IsOptional } from "class-validator";
import GraphQLJSON from "graphql-type-json";
import { IsEnumI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { Actions } from "../../../providers/security/casl/actions.enum";
import { PermissionCondition } from "../../../providers/security/casl/interfaces/authorizable-user.interface";
import { PermissionEntity } from "../entities/permission.entity";

@InputType()
export class CreatePermissionInput implements Partial<PermissionEntity> {
  @IsEnumI18N(Actions)
  @Field(() => Actions)
  action!: Actions;

  @LengthI18N(2, 128)
  @Field()
  subject!: string;

  @IsOptional()
  @IsObject()
  @Field(() => GraphQLJSON, { nullable: true })
  conditions?: PermissionCondition;
}
