import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { EmailModule } from "../../providers/email/email.module";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { EmailAddressModule } from "../email-address/email-address.module";
import { EmailAddressConfirmationService } from "./email-address-confirmation.service";
import { EmailAddressConfirmationEntity } from "./entities/email-address-confirmation.entity";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [EmailModule, EmailAddressModule, NestjsQueryTypeOrmModule.forFeature([EmailAddressConfirmationEntity])],
      services: [EmailAddressConfirmationService],
    }),
  ],
  providers: [EmailAddressConfirmationService],
  exports: [EmailAddressConfirmationService],
})
export class EmailAddressConfirmationModule {}
