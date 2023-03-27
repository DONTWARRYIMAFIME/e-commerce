import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Global, Module } from "@nestjs/common";
import { SecurityConfigModule } from "../../config/security/security.module";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { UserAssembler } from "./assemblers/user.assembler";
import { CreateUserInput } from "./dto/create-user.input";
import { UpdateUserInput } from "./dto/update-user.input";
import { UserEntity } from "./entities/user.entity";
import { UserHook } from "./hooks/user.hook";
import { UserSubscriber } from "./subscribers/user.subscriber";
import { UserService } from "./user.service";

// Module should be global to use UserHook
@Global()
@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [SecurityConfigModule, NestjsQueryTypeOrmModule.forFeature([UserEntity])],
      services: [UserService],
      assemblers: [UserAssembler],
      resolvers: [
        {
          DTOClass: UserEntity,
          EntityClass: UserEntity,
          CreateDTOClass: CreateUserInput,
          UpdateDTOClass: UpdateUserInput,
          ServiceClass: UserService,
          AssemblerClass: UserAssembler,
        },
      ],
    }),
  ],
  providers: [UserService, UserHook, UserSubscriber],
  exports: [UserService, UserHook],
})
export class UserModule {}
