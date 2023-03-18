import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { EmailModule } from "../../providers/email/email.module";
import { EmailAddressModule } from "../email-address/email-address.module";
import { EmailAddressConfirmationService } from "./email-address-confirmation.service";
import { EmailAddressConfirmation } from "./entities/email-address-confirmation.entity";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [EmailModule, EmailAddressModule, NestjsQueryTypeOrmModule.forFeature([EmailAddressConfirmation])],
      services: [EmailAddressConfirmationService],
    }),
  ],
  providers: [EmailAddressConfirmationService],
  exports: [EmailAddressConfirmationService],
})
export class EmailAddressConfirmationModule {}
