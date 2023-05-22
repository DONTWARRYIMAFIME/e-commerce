import { NestjsQueryGraphQLModule, PagingStrategies } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { WarehouseItemModule } from "../warehouse-item/warehouse-item.module";
import { CreateWarehouseInput } from "./dto/create-warehouse.input";
import { UpdateWarehouseInput } from "./dto/update-warehouse.input";
import { WarehouseEntity } from "./entities/warehouse.entity";
import { WarehouseResolver } from "./warehouse.resolver";
import { WarehouseService } from "./warehouse.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [WarehouseItemModule, NestjsQueryTypeOrmModule.forFeature([WarehouseEntity])],
      services: [WarehouseService],
      resolvers: [
        {
          DTOClass: WarehouseEntity,
          EntityClass: WarehouseEntity,
          CreateDTOClass: CreateWarehouseInput,
          UpdateDTOClass: UpdateWarehouseInput,
          ServiceClass: WarehouseService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, WarehouseEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, WarehouseEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, WarehouseEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, WarehouseEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [WarehouseResolver, WarehouseService],
  exports: [WarehouseService],
})
export class WarehouseModule {}
