import { ParseUUIDPipe } from "@nestjs/common";
import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { FileUpload, GraphQLUpload } from "graphql-upload";
import { Id } from "../../common/types/id.type";
import { IsPublic } from "../../providers/security/authentication/decorators/isPublic.decorator";
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
  async updateOneMedia(@Args("id", ParseUUIDPipe) id: Id, @Args("file", { type: () => GraphQLUpload }) file: FileUpload): Promise<MediaEntity> {
    return this.mediaService.updateOneMedia({ id, file, path: "media" });
  }
}
