import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreateEmailAddressInput } from "./dto/create-email-address.input";
import { UpdateEmailAddressInput } from "./dto/update-email-address.input";
import { EmailAddressService } from "./email-address.service";
import { EmailAddressEntity } from "./entities/email-address.entity";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([EmailAddressEntity])],
      services: [EmailAddressService],
      resolvers: [
        {
          DTOClass: EmailAddressEntity,
          EntityClass: EmailAddressEntity,
          CreateDTOClass: CreateEmailAddressInput,
          UpdateDTOClass: UpdateEmailAddressInput,
          ServiceClass: EmailAddressService,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, EmailAddressEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, EmailAddressEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, EmailAddressEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, EmailAddressEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [EmailAddressService],
  exports: [EmailAddressService],
})
export class EmailAddressModule {}
