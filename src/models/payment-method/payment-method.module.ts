import { Module } from "@nestjs/common";
import { SortDirection } from "@ptc-org/nestjs-query-core";
import { NestjsQueryGraphQLModule, PagingStrategies } from "@ptc-org/nestjs-query-graphql";
import { NestjsQueryTypeOrmModule } from "@ptc-org/nestjs-query-typeorm";
import { IsPublic } from "../../providers/security/auth/decorators/is-public.decorator";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { MediaModule } from "../media/media.module";
import { CreatePaymentMethodInput } from "./dto/create-payment-method.input";
import { UpdatePaymentMethodInput } from "./dto/update-payment-method.input";
import { PaymentMethodEntity } from "./entities/payment-method.entity";
import { PaymentMethodResolver } from "./payment-method.resolver";
import { PaymentMethodService } from "./payment-method.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [MediaModule, NestjsQueryTypeOrmModule.forFeature([PaymentMethodEntity])],
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
            decorators: [IsPublic()],
            defaultSort: [{ field: "createdAt", direction: SortDirection.ASC }],
          },
          create: { disabled: true },
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
  providers: [PaymentMethodResolver, PaymentMethodService],
  exports: [PaymentMethodService],
})
export class PaymentMethodModule {}
