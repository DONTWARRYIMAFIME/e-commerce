import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Global, Module } from "@nestjs/common";
import { SecurityConfigModule } from "../../config/security/security.module";
import { CreateUserInput } from "./dtos/create-user.input";
import { UpdateUserInput } from "./dtos/update-user.input";
import { User } from "./entities/user.entity";
import { UserSubscriber } from "./subscribers/user.subscriber";
import { UserService } from "./user.service";

@Global()
@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [SecurityConfigModule, NestjsQueryTypeOrmModule.forFeature([User])],
      services: [UserService],
      resolvers: [
        {
          DTOClass: User,
          EntityClass: User,
          CreateDTOClass: CreateUserInput,
          UpdateDTOClass: UpdateUserInput,
          ServiceClass: UserService,
        },
      ],
    }),
  ],
  providers: [UserService, UserSubscriber],
  exports: [UserService],
})
export class UserModule {}
