import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreatePaymentIntentInput } from "./dto/create-payment-intent.input";
import { UpdatePaymentIntentInput } from "./dto/update-payment-intent.input";
import { PaymentIntentEntity } from "./entities/payment-intent.entity";
import { PaymentIntentService } from "./payment-intent.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([PaymentIntentEntity])],
      services: [PaymentIntentService],
      resolvers: [
        {
          DTOClass: PaymentIntentEntity,
          EntityClass: PaymentIntentEntity,
          CreateDTOClass: CreatePaymentIntentInput,
          UpdateDTOClass: UpdatePaymentIntentInput,
          ServiceClass: PaymentIntentService,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, PaymentIntentEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, PaymentIntentEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, PaymentIntentEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, PaymentIntentEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [PaymentIntentService],
  exports: [PaymentIntentService],
})
export class PaymentIntentModule {}
