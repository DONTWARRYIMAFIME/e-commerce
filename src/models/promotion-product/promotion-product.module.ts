import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreatePromotionProductInput } from "./dto/create-promotion-product.input";
import { UpdatePromotionProductInput } from "./dto/update-promotion-product.input";
import { PromotionProductEntity } from "./entities/promotion-product.entity";
import { PromotionProductHook } from "./hooks/promotion-product.hook";
import { PromotionProductService } from "./promotion-product.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([PromotionProductEntity])],
      services: [PromotionProductService],
      resolvers: [
        {
          DTOClass: PromotionProductEntity,
          EntityClass: PromotionProductEntity,
          CreateDTOClass: CreatePromotionProductInput,
          UpdateDTOClass: UpdatePromotionProductInput,
          ServiceClass: PromotionProductService,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, PromotionProductEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, PromotionProductEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, PromotionProductEntity, PromotionProductHook)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, PromotionProductEntity, PromotionProductHook)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [PromotionProductService, PromotionProductHook],
  exports: [PromotionProductService],
})
export class PromotionProductModule {}
