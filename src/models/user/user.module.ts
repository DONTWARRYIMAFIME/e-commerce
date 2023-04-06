import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Global, Module } from "@nestjs/common";
import { SecurityConfigModule } from "../../config/security/security.module";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
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
    CaslGraphQLModule.forFeature({
      imports: [SecurityConfigModule, MediaModule, AddressModule, NestjsQueryTypeOrmModule.forFeature([UserEntity])],
      services: [UserService],
      resolvers: [
        {
          DTOClass: UserEntity,
          EntityClass: UserEntity,
          CreateDTOClass: CreateUserInput,
          UpdateDTOClass: UpdateUserInput,
          ServiceClass: UserService,
        },
      ],
    }),
  ],
  providers: [UserResolver, UserService, UserHook],
  exports: [UserService, UserHook],
})
export class UserModule {}
