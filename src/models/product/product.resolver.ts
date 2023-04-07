import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { FileUpload, GraphQLUpload } from "graphql-upload";
import { Id } from "../../common/types/id.type";
import { CreateOneProductArgsType } from "./dto/create-product.input";
import { SelectProductArgsType } from "./dto/select-product.input";
import { RemoveMediaArgsType } from "./dto/update-product.input";
import { ProductEntity } from "./entities/product.entity";
import { ProductService } from "./product.service";

@Resolver(() => ProductEntity)
export class ProductResolver {
  constructor(private readonly productService: ProductService) {}

  @Mutation(() => ProductEntity)
  public async createOneProduct(
    @Args() args: CreateOneProductArgsType,
    @Args("files", { type: () => [GraphQLUpload], defaultValue: [] }) fileUploads: Promise<FileUpload>[],
  ): Promise<ProductEntity> {
    const { input } = args.input;
    const files = await Promise.all(fileUploads);
    return this.productService.createOne(input, files);
  }

  @Mutation(() => ProductEntity)
  public async addMediaToProduct(
    @Args() args: SelectProductArgsType,
    @Args("files", { type: () => [GraphQLUpload], defaultValue: [] }) fileUploads: Promise<FileUpload>[],
  ): Promise<ProductEntity> {
    const { id } = args.input;
    const files = await Promise.all(fileUploads);
    return this.productService.addMediaToProduct(id, files);
  }

  @Mutation(() => ProductEntity)
  public async removeMediaFromProduct(@Args() args: RemoveMediaArgsType): Promise<ProductEntity> {
    const { id, relationIds } = args.input;
    return this.productService.removeMediaFromProduct(id as Id, relationIds as Id[]);
  }
}
