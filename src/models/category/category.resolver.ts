import { Query, Resolver } from "@nestjs/graphql";
import { IsPublic } from "../../providers/security/auth/decorators/is-public.decorator";
import { CategoryService } from "./category.service";
import { CategoryEntity } from "./entities/category.entity";

@Resolver(() => CategoryEntity)
export class CategoryResolver {
  constructor(private readonly categoryService: CategoryService) {}

  @IsPublic()
  @Query(() => [CategoryEntity])
  public async categoryTree(): Promise<CategoryEntity[]> {
    return this.categoryService.findCategoryTree();
  }
}
