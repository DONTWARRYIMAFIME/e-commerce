import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreateRoleInput } from "./dto/create-role.input";
import { UpdateRoleInput } from "./dto/update-role.input";
import { RoleEntity } from "./entities/role.entity";
import { RoleService } from "./role.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([RoleEntity])],
      services: [RoleService],
      resolvers: [
        {
          DTOClass: RoleEntity,
          EntityClass: RoleEntity,
          CreateDTOClass: CreateRoleInput,
          UpdateDTOClass: UpdateRoleInput,
          ServiceClass: RoleService,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, RoleEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, RoleEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, RoleEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, RoleEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [RoleService],
  exports: [RoleService],
})
export class RoleModule {}
