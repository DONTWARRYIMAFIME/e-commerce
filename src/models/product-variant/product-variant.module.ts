import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CreateProductVariantInput } from "./dto/create-product-variant.input";
import { UpdateProductVariantInput } from "./dto/update-product-variant.input";
import { ProductVariantEntity } from "./entities/product-variant.entity";
import { ProductVariantService } from "./product-variant.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([ProductVariantEntity])],
      services: [ProductVariantService],
      resolvers: [
        {
          DTOClass: ProductVariantEntity,
          EntityClass: ProductVariantEntity,
          CreateDTOClass: CreateProductVariantInput,
          UpdateDTOClass: UpdateProductVariantInput,
          ServiceClass: ProductVariantService,
        },
      ],
    }),
  ],
  providers: [ProductVariantService],
  exports: [ProductVariantService],
})
export class ProductVariantModule {}
