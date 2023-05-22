import { NestjsQueryGraphQLModule, PagingStrategies } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreatePromotionInput } from "./dto/create-promotion.input";
import { UpdatePromotionInput } from "./dto/update-promotion.input";
import { PromotionEntity } from "./entities/promotion.entity";
import { PromotionService } from "./promotion.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([PromotionEntity])],
      services: [PromotionService],
      resolvers: [
        {
          DTOClass: PromotionEntity,
          EntityClass: PromotionEntity,
          CreateDTOClass: CreatePromotionInput,
          UpdateDTOClass: UpdatePromotionInput,
          ServiceClass: PromotionService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, PromotionEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, PromotionEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, PromotionEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, PromotionEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [PromotionService],
  exports: [PromotionService],
})
export class PromotionModule {}
