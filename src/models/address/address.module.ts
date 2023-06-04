import { Module } from "@nestjs/common";
import { NestjsQueryGraphQLModule, PagingStrategies } from "@ptc-org/nestjs-query-graphql";
import { NestjsQueryTypeOrmModule } from "@ptc-org/nestjs-query-typeorm";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { AddressService } from "./address.service";
import { CreateAddressInput } from "./dto/create-address.input";
import { UpdateAddressInput } from "./dto/update-address.input";
import { AddressEntity } from "./entities/address.entity";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([AddressEntity])],
      services: [AddressService],
      resolvers: [
        {
          DTOClass: AddressEntity,
          EntityClass: AddressEntity,
          CreateDTOClass: CreateAddressInput,
          UpdateDTOClass: UpdateAddressInput,
          ServiceClass: AddressService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, AddressEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, AddressEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, AddressEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, AddressEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [AddressService],
  exports: [AddressService],
})
export class AddressModule {}
