import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { MediaModule } from "../media/media.module";
import { CreateProductInput } from "./dto/create-product.input";
import { UpdateProductInput } from "./dto/update-product.input";
import { ProductEntity } from "./entities/product.entity";
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
          create: { disabled: true },
        },
      ],
    }),
  ],
  providers: [ProductResolver, ProductService],
})
export class ProductModule {}
