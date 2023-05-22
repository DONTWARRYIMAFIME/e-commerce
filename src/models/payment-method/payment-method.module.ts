import { NestjsQueryGraphQLModule, PagingStrategies } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreatePaymentMethodInput } from "./dto/create-payment-method.input";
import { UpdatePaymentMethodInput } from "./dto/update-payment-method.input";
import { PaymentMethodEntity } from "./entities/payment-method.entity";
import { PaymentMethodService } from "./payment-method.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([PaymentMethodEntity])],
      services: [PaymentMethodService],
      resolvers: [
        {
          DTOClass: PaymentMethodEntity,
          EntityClass: PaymentMethodEntity,
          CreateDTOClass: CreatePaymentMethodInput,
          UpdateDTOClass: UpdatePaymentMethodInput,
          ServiceClass: PaymentMethodService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, PaymentMethodEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, PaymentMethodEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, PaymentMethodEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, PaymentMethodEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [PaymentMethodService],
  exports: [PaymentMethodService],
})
export class PaymentMethodModule {}
