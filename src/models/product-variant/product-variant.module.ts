import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreateProductVariantInput } from "./dto/create-product-variant.input";
import { UpdateProductVariantInput } from "./dto/update-product-variant.input";
import { ProductVariantEntity } from "./entities/product-variant.entity";
import { ProductVariantHook } from "./hooks/product-variant.hook";
import { ProductVariantService } from "./product-variant.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([ProductVariantEntity])],
      services: [ProductVariantService],
      resolvers: [
        {
          DTOClass: ProductVariantEntity,
          EntityClass: ProductVariantEntity,
          CreateDTOClass: CreateProductVariantInput,
          UpdateDTOClass: UpdateProductVariantInput,
          ServiceClass: ProductVariantService,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, ProductVariantEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, ProductVariantEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, ProductVariantEntity, ProductVariantHook)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, ProductVariantEntity, ProductVariantHook)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [ProductVariantService, ProductVariantHook],
  exports: [ProductVariantService],
})
export class ProductVariantModule {}
