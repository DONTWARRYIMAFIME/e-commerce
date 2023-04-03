import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { DeliveryMethodService } from "./delivery-method.service";
import { CreateDeliveryMethodInput } from "./dto/create-delivery-method.input";
import { UpdateDeliveryMethodInput } from "./dto/update-delivery-method.input";
import { DeliveryMethodEntity } from "./entities/delivery-method.entity";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([DeliveryMethodEntity])],
      services: [DeliveryMethodService],
      resolvers: [
        {
          DTOClass: DeliveryMethodEntity,
          EntityClass: DeliveryMethodEntity,
          CreateDTOClass: CreateDeliveryMethodInput,
          UpdateDTOClass: UpdateDeliveryMethodInput,
          ServiceClass: DeliveryMethodService,
        },
      ],
    }),
  ],
  providers: [DeliveryMethodService],
  exports: [DeliveryMethodService],
})
export class DeliveryMethodModule {}