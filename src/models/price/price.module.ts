import { NestjsQueryGraphQLModule, PagingStrategies } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreatePriceInput } from "./dto/create-price.input";
import { UpdatePriceInput } from "./dto/update-price.input";
import { PriceEntity } from "./entities/price.entity";
import { PriceService } from "./price.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([PriceEntity])],
      services: [PriceService],
      resolvers: [
        {
          DTOClass: PriceEntity,
          EntityClass: PriceEntity,
          CreateDTOClass: CreatePriceInput,
          UpdateDTOClass: UpdatePriceInput,
          ServiceClass: PriceService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, PriceEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, PriceEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, PriceEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, PriceEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [PriceService],
  exports: [PriceService],
})
export class PriceModule {}
