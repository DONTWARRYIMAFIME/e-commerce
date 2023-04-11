import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreatePickupPointInput } from "./dto/create-pickup-point.input";
import { UpdatePickupPointInput } from "./dto/update-pickup-point.input";
import { PickupPointEntity } from "./entities/pickup-point.entity";
import { PickupPointService } from "./pickup-point.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([PickupPointEntity])],
      services: [PickupPointService],
      resolvers: [
        {
          DTOClass: PickupPointEntity,
          EntityClass: PickupPointEntity,
          CreateDTOClass: CreatePickupPointInput,
          UpdateDTOClass: UpdatePickupPointInput,
          ServiceClass: PickupPointService,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, PickupPointEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, PickupPointEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, PickupPointEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, PickupPointEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [PickupPointService],
  exports: [PickupPointService],
})
export class PickupPointModule {}
