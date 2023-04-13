import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
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
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, CategoryEntity)],
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
  providers: [CategoryService],
  exports: [CategoryService],
})
export class CategoryModule {}
