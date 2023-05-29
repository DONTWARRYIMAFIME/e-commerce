import { NestjsQueryGraphQLModule, PagingStrategies } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { DeliveryMethodService } from "./delivery-method.service";
import { CreateDeliveryMethodInput } from "./dto/create-delivery-method.input";
import { UpdateDeliveryMethodInput } from "./dto/update-delivery-method.input";
import { DeliveryMethodEntity } from "./entities/delivery-method.entity";
import { DeliveryMethodTypes } from "./enums/delivery-method-type";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([DeliveryMethodEntity])],
      services: [DeliveryMethodService],
      resolvers: [
        {
          DTOClass: DeliveryMethodEntity,
          EntityClass: DeliveryMethodEntity,
          CreateDTOClass: CreateDeliveryMethodInput,
          UpdateDTOClass: UpdateDeliveryMethodInput,
          ServiceClass: DeliveryMethodService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, DeliveryMethodEntity)],
            defaultFilter: { type: { eq: DeliveryMethodTypes.HOME_DELIVERY } },
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, DeliveryMethodEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, DeliveryMethodEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, DeliveryMethodEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [DeliveryMethodService],
  exports: [DeliveryMethodService],
})
export class DeliveryMethodModule {}
