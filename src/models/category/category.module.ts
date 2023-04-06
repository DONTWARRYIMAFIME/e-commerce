import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CategoryService } from "./category.service";
import { CreateCategoryInput } from "./dto/create-category.input";
import { UpdateCategoryInput } from "./dto/update-category.input";
import { CategoryEntity } from "./entities/category.entity";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
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
