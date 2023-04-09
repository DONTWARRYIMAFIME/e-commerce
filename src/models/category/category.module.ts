import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CategoryService } from "./category.service";
import { CreateCategoryInput } from "./dto/create-category.input";
import { UpdateCategoryInput } from "./dto/update-category.input";
import { CategoryEntity } from "./entities/category.entity";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([CategoryEntity])],
      services: [CategoryService],
      resolvers: [
        {
          DTOClass: CategoryEntity,
          EntityClass: CategoryEntity,
          CreateDTOClass: CreateCategoryInput,
          UpdateDTOClass: UpdateCategoryInput,
          ServiceClass: CategoryService,
        },
      ],
    }),
  ],
  providers: [CategoryService],
  exports: [CategoryService],
})
export class CategoryModule {}
