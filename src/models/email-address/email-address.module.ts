import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CreateEmailAddressInput } from "./dto/create-email-address.input";
import { UpdateEmailAddressInput } from "./dto/update-email-address.input";
import { EmailAddressService } from "./email-address.service";
import { EmailAddressEntity } from "./entities/email-address.entity";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([EmailAddressEntity])],
      services: [EmailAddressService],
      resolvers: [
        {
          DTOClass: EmailAddressEntity,
          EntityClass: EmailAddressEntity,
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
