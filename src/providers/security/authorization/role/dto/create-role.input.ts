import { Field, InputType } from "@nestjs/graphql";
import { IsEnum } from "class-validator";
import { RoleEntity } from "../entities/role.entity";
import { Roles } from "../role.enum";

@InputType()
export class CreateRoleInput implements Partial<RoleEntity> {
  @IsEnum(Roles)
  @Field(() => Roles)
  name: Roles;
}
