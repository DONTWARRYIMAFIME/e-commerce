import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CreateProductInput } from "./dto/create-product.input";
import { UpdateProductInput } from "./dto/update-product.input";
import { ProductEntity } from "./entities/product.entity";
import { ProductVariantService } from "./product.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([ProductEntity])],
      services: [ProductVariantService],
      resolvers: [
        {
          DTOClass: ProductEntity,
          EntityClass: ProductEntity,
          CreateDTOClass: CreateProductInput,
          UpdateDTOClass: UpdateProductInput,
          ServiceClass: ProductVariantService,
        },
      ],
    }),
  ],
  providers: [ProductVariantService],
})
export class ProductModule {}
