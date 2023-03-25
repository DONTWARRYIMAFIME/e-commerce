import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CreateEmailAddressInput } from "./dto/create-email-address.input";
import { UpdateEmailAddressInput } from "./dto/update-email-address.input";
import { EmailAddressService } from "./email-address.service";
import { EmailAddress } from "./entities/email-address.entity";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([EmailAddress])],
      services: [EmailAddressService],
      resolvers: [
        {
          DTOClass: EmailAddress,
          EntityClass: EmailAddress,
          CreateDTOClass: CreateEmailAddressInput,
          UpdateDTOClass: UpdateEmailAddressInput,
          ServiceClass: EmailAddressService,
        },
      ],
    }),
  ],
  providers: [EmailAddressService],
  exports: [EmailAddressService],
})
export class EmailAddressModule {}
