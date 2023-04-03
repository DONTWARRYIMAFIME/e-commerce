import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { AddressService } from "./address.service";
import { CreateAddressInput } from "./dto/create-address.input";
import { UpdateAddressInput } from "./dto/update-address.input";
import { AddressEntity } from "./entities/address.entity";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([AddressEntity])],
      services: [AddressService],
      resolvers: [
        {
          DTOClass: AddressEntity,
          EntityClass: AddressEntity,
          CreateDTOClass: CreateAddressInput,
          UpdateDTOClass: UpdateAddressInput,
          ServiceClass: AddressService,
        },
      ],
    }),
  ],
  providers: [AddressService],
  exports: [AddressService],
})
export class AddressModule {}
