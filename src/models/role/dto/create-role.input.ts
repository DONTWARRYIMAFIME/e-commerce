import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { IsEnumI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { CreatePermissionInput } from "../../permission/dto/create-permission.input";
import { PermissionEntity } from "../../permission/entities/permission.entity";
import { RoleEntity } from "../entities/role.entity";
import { Roles } from "../enums/roles.enum";

@InputType()
export class CreateRoleInput implements Partial<RoleEntity> {
  @IsEnumI18N(Roles)
  @Field(() => Roles)
  code!: Roles;

  @LengthI18N(2, 128)
  @Field()
  name!: string;

  @IsOptional()
  @Field(() => [CreatePermissionInput], { defaultValue: [] })
  permissions!: PermissionEntity[];
}
