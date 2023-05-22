import { NestjsQueryGraphQLModule, PagingStrategies } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { IsPublic } from "../../providers/security/auth/decorators/is-public.decorator";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CategoryResolver } from "./category.resolver";
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
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [IsPublic()],
            defaultResultSize: 50,
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, CategoryEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, CategoryEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, CategoryEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [CategoryResolver, CategoryService],
  exports: [CategoryService],
})
export class CategoryModule {}
