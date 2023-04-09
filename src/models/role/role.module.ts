import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
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
        },
      ],
    }),
  ],
  providers: [RoleService],
  exports: [RoleService],
})
export class RoleModule {}
