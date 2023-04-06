import { Field, InputType } from "@nestjs/graphql";
import { IsEnumI18N } from "../../../../i18n/i18n.decorators";
import { RoleEntity } from "../entities/role.entity";
import { Roles } from "../role.enum";

@InputType()
export class CreateRoleInput implements Partial<RoleEntity> {
  @IsEnumI18N(Roles)
  @Field(() => Roles)
  name: Roles;
}
