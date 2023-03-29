import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { FileUpload, GraphQLUpload } from "graphql-upload";
import { IsPublic } from "../../providers/security/authentication/decorators/isPublic.decorator";
import { MediaEntity } from "./entities/media.entity";
import { MediaService } from "./media.service";

@Resolver(() => MediaEntity)
export class MediaResolver {
  constructor(private readonly mediaService: MediaService) {}

  @IsPublic()
  @Mutation(() => MediaEntity)
  async uploadMedia(@Args("file", { type: () => GraphQLUpload }) file: FileUpload): Promise<MediaEntity> {
    return this.mediaService.saveMedia(file.createReadStream(), file.filename, "media");
  }
}
