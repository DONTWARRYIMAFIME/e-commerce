import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../casl-graphql.module";
import { CreateRoleInput } from "./dto/create-role.input";
import { UpdateRoleInput } from "./dto/update-role.input";
import { RoleEntity } from "./entities/role.entity";
import { RoleService } from "./role.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([RoleEntity])],
      services: [RoleService],
      resolvers: [
        {
          DTOClass: RoleEntity,
          EntityClass: RoleEntity,
          CreateDTOClass: CreateRoleInput,
          UpdateDTOClass: UpdateRoleInput,
          ServiceClass: RoleService,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
      ],
    }),
  ],
  providers: [RoleService],
  exports: [RoleService],
})
export class RoleModule {}
