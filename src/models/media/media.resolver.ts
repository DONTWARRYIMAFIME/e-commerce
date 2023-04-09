import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { FileUpload, GraphQLUpload } from "graphql-upload";
import { SelectMediaArgsType } from "./dto/select-media.input";
import { IsPublic } from "../../providers/security/auth/decorators/is-public.decorator";
import { MediaEntity } from "./entities/media.entity";
import { MediaService } from "./media.service";

@Resolver(() => MediaEntity)
export class MediaResolver {
  constructor(private readonly mediaService: MediaService) {}

  @IsPublic()
  @Mutation(() => MediaEntity)
  async createOneMedia(@Args("file", { type: () => GraphQLUpload }) file: FileUpload): Promise<MediaEntity> {
    return this.mediaService.createOneMedia({ file, path: "media" });
  }

  @IsPublic()
  @Mutation(() => MediaEntity)
  async updateOneMedia(@Args() args: SelectMediaArgsType, @Args("file", { type: () => GraphQLUpload }) file: FileUpload): Promise<MediaEntity> {
    const { id } = args.input;
    return this.mediaService.updateOneMedia({ id, file, path: "media" });
  }
}
