import { UseGuards } from "@nestjs/common";
import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { FileUpload, GraphQLUpload } from "graphql-upload";
import { Id } from "../../common/types/id.type";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { CreateOneProductArgsType } from "./dto/create-product.input";
import { SelectProductArgsType } from "./dto/select-product.input";
import { RemoveMediaArgsType } from "./dto/update-product.input";
import { ProductEntity } from "./entities/product.entity";
import { ProductService } from "./product.service";

@Resolver(() => ProductEntity)
export class ProductResolver {
  constructor(private readonly productService: ProductService) {}

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.CREATE, ProductEntity)
  @Mutation(() => ProductEntity)
  public async createOneProduct(
    @Args() args: CreateOneProductArgsType,
    @Args("files", { type: () => [GraphQLUpload], defaultValue: [] }) fileUploads: Promise<FileUpload>[],
  ): Promise<ProductEntity> {
    const { input } = args.input;
    const files = await Promise.all(fileUploads);
    return this.productService.createOne(input, files);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, ProductEntity)
  @Mutation(() => ProductEntity)
  public async addMediaToProduct(
    @Args() args: SelectProductArgsType,
    @Args("files", { type: () => [GraphQLUpload], defaultValue: [] }) fileUploads: Promise<FileUpload>[],
  ): Promise<ProductEntity> {
    const { id } = args.input;
    const files = await Promise.all(fileUploads);
    return this.productService.addMediaToProduct(id, files);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, ProductEntity)
  @Mutation(() => ProductEntity)
  public async removeMediaFromProduct(@Args() args: RemoveMediaArgsType): Promise<ProductEntity> {
    const { id, relationIds } = args.input;
    return this.productService.removeMediaFromProduct(id as Id, relationIds as Id[]);
  }
}
