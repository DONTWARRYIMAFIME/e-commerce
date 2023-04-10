import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
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
