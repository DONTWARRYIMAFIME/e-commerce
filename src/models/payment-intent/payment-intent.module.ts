import { NestjsQueryGraphQLModule, PagingStrategies } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CartModule } from "../cart/cart.module";
import { PaymentMethodModule } from "../payment-method/payment-method.module";
import { CreatePaymentIntentInput } from "./dto/create-payment-intent.input";
import { UpdatePaymentIntentInput } from "./dto/update-payment-intent.input";
import { PaymentIntentEntity } from "./entities/payment-intent.entity";
import { PaymentIntentResolver } from "./payment-intent.resolver";
import { PaymentIntentService } from "./payment-intent.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [CartModule, PaymentMethodModule, NestjsQueryTypeOrmModule.forFeature([PaymentIntentEntity])],
      services: [PaymentIntentService],
      resolvers: [
        {
          DTOClass: PaymentIntentEntity,
          EntityClass: PaymentIntentEntity,
          CreateDTOClass: CreatePaymentIntentInput,
          UpdateDTOClass: UpdatePaymentIntentInput,
          ServiceClass: PaymentIntentService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
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
  providers: [PaymentIntentResolver, PaymentIntentService],
  exports: [PaymentIntentService],
})
export class PaymentIntentModule {}
