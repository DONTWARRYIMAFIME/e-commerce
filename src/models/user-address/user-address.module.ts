import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreateUserAddressInput } from "./dto/create-user-address.input";
import { UpdateUserAddressInput } from "./dto/update-user-address.input";
import { UserAddressEntity } from "./entities/user-address.entity";
import { UserAddressHook } from "./hooks/user-address.hook";
import { UserAddressService } from "./user-address.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([UserAddressEntity])],
      services: [UserAddressService],
      resolvers: [
        {
          DTOClass: UserAddressEntity,
          EntityClass: UserAddressEntity,
          CreateDTOClass: CreateUserAddressInput,
          UpdateDTOClass: UpdateUserAddressInput,
          ServiceClass: UserAddressService,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, UserAddressEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, UserAddressEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, UserAddressEntity, UserAddressHook)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, UserAddressEntity, UserAddressHook)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [UserAddressService],
  exports: [UserAddressService],
})
export class UserAddressModule {}
