import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Global, Module } from "@nestjs/common";
import { SecurityConfigModule } from "../../config/security/security.module";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { AddressModule } from "../address/address.module";
import { MediaModule } from "../media/media.module";
import { CreateUserInput } from "./dto/create-user.input";
import { UpdateUserInput } from "./dto/update-user.input";
import { UserEntity } from "./entities/user.entity";
import { UserHook } from "./hooks/user.hook";
import { UserResolver } from "./user.resolver";
import { UserService } from "./user.service";

@Global()
@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [SecurityConfigModule, MediaModule, AddressModule, NestjsQueryTypeOrmModule.forFeature([UserEntity])],
      services: [UserService],
      resolvers: [
        {
          DTOClass: UserEntity,
          EntityClass: UserEntity,
          CreateDTOClass: CreateUserInput,
          UpdateDTOClass: UpdateUserInput,
          ServiceClass: UserService,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, UserEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, UserEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, UserEntity, UserHook)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, UserEntity, UserHook)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [UserResolver, UserService, UserHook],
  exports: [UserService, UserHook],
})
export class UserModule {}
