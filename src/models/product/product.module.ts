import { Module } from "@nestjs/common";
import { NestjsQueryGraphQLModule, PagingStrategies } from "@ptc-org/nestjs-query-graphql";
import { NestjsQueryTypeOrmModule } from "@ptc-org/nestjs-query-typeorm";
import { IsPublic } from "../../providers/security/auth/decorators/is-public.decorator";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { MediaModule } from "../media/media.module";
import { CreateProductInput } from "./dto/create-product.input";
import { UpdateProductInput } from "./dto/update-product.input";
import { ProductEntity } from "./entities/product.entity";
import { ProductHook } from "./hooks/product.hook";
import { ProductResolver } from "./product.resolver";
import { ProductService } from "./product.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [MediaModule, NestjsQueryTypeOrmModule.forFeature([ProductEntity])],
      services: [ProductService],
      resolvers: [
        {
          DTOClass: ProductEntity,
          EntityClass: ProductEntity,
          CreateDTOClass: CreateProductInput,
          UpdateDTOClass: UpdateProductInput,
          ServiceClass: ProductService,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [IsPublic()],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, ProductEntity)],
            disabled: true,
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, ProductEntity, ProductHook)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, ProductEntity, ProductHook)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [ProductResolver, ProductService, ProductHook],
})
export class ProductModule {}
