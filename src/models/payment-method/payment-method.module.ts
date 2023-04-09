import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CreatePaymentMethodInput } from "./dto/create-payment-method.input";
import { UpdatePaymentMethodInput } from "./dto/update-payment-method.input";
import { PaymentMethodEntity } from "./entities/payment-method.entity";
import { PaymentMethodService } from "./payment-method.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([PaymentMethodEntity])],
      services: [PaymentMethodService],
      resolvers: [
        {
          DTOClass: PaymentMethodEntity,
          EntityClass: PaymentMethodEntity,
          CreateDTOClass: CreatePaymentMethodInput,
          UpdateDTOClass: UpdatePaymentMethodInput,
          ServiceClass: PaymentMethodService,
        },
      ],
    }),
  ],
  providers: [PaymentMethodService],
  exports: [PaymentMethodService],
})
export class PaymentMethodModule {}
