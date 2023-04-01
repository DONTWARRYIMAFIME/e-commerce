import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CreateWarehouseStatusInput } from "./dto/create-warehouse-status.input";
import { UpdateWarehouseStatusInput } from "./dto/update-warehouse-status.input";
import { WarehouseStatusEntity } from "./entities/warehouse-status.entity";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([WarehouseStatusEntity])],
      resolvers: [
        {
          DTOClass: WarehouseStatusEntity,
          EntityClass: WarehouseStatusEntity,
          CreateDTOClass: CreateWarehouseStatusInput,
          UpdateDTOClass: UpdateWarehouseStatusInput,
        },
      ],
    }),
  ],
})
export class WarehouseStatusModule {}
