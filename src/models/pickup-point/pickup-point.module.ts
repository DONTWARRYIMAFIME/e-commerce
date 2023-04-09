import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
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
        },
      ],
    }),
  ],
  providers: [PickupPointService],
  exports: [PickupPointService],
})
export class PickupPointModule {}
