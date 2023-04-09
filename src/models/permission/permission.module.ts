import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CreatePermissionInput } from "./dto/create-permission.input";
import { UpdatePermissionInput } from "./dto/update-permission.input";
import { PermissionEntity } from "./entities/permission.entity";
import { PermissionService } from "./permission.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([PermissionEntity])],
      services: [PermissionService],
      resolvers: [
        {
          DTOClass: PermissionEntity,
          EntityClass: PermissionEntity,
          CreateDTOClass: CreatePermissionInput,
          UpdateDTOClass: UpdatePermissionInput,
          ServiceClass: PermissionService,
        },
      ],
    }),
  ],
  providers: [PermissionService],
  exports: [PermissionService],
})
export class PermissionModule {}
