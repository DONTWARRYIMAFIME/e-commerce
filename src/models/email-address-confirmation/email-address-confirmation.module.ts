import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AppConfigModule } from "../../config/app/app.module";
import { EmailAddressModule } from "../email-address/email-address.module";
import { EmailAddressConfirmationController } from "./email-address-confirmation.controller";
import { EmailAddressConfirmationResolver } from "./email-address-confirmation.resolver";
import { EmailAddressConfirmationService } from "./email-address-confirmation.service";
import { EmailAddressConfirmationEntity } from "./entities/email-address-confirmation.entity";
import { UserCreatedListener } from "./listeners/user-create.listener";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [AppConfigModule, EmailAddressModule, NestjsQueryTypeOrmModule.forFeature([EmailAddressConfirmationEntity])],
      services: [EmailAddressConfirmationService],
      resolvers: [
        {
          DTOClass: EmailAddressConfirmationEntity,
          EntityClass: EmailAddressConfirmationEntity,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
      ],
    }),
  ],
  controllers: [EmailAddressConfirmationController],
  providers: [EmailAddressConfirmationResolver, EmailAddressConfirmationService, UserCreatedListener],
  exports: [EmailAddressConfirmationService],
})
export class EmailAddressConfirmationModule {}
