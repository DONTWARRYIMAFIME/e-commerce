import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { DeliveryMethodStatusService } from "./delivery-method-status.service";
import { CreateDeliveryMethodStatusInput } from "./dto/create-delivery-method-status.input";
import { UpdateDeliveryMethodStatusInput } from "./dto/update-delivery-method-status.input";
import { DeliveryMethodStatusEntity } from "./entities/delivery-method-status.entity";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([DeliveryMethodStatusEntity])],
      services: [DeliveryMethodStatusService],
      resolvers: [
        {
          DTOClass: DeliveryMethodStatusEntity,
          EntityClass: DeliveryMethodStatusEntity,
          CreateDTOClass: CreateDeliveryMethodStatusInput,
          UpdateDTOClass: UpdateDeliveryMethodStatusInput,
          ServiceClass: DeliveryMethodStatusService,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
      ],
    }),
  ],
  providers: [DeliveryMethodStatusService],
  exports: [DeliveryMethodStatusService],
})
export class DeliveryMethodStatusModule {}
