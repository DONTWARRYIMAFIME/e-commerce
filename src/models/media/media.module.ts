import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { IsPublic } from "../../providers/security/authentication/decorators/isPublic.decorator";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CloudinaryModule } from "../../providers/storage/cloudinary/cloudinary.module";
import { MediaEntity } from "./entities/media.entity";
import { MediaResolver } from "./media.resolver";
import { MediaService } from "./media.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [CloudinaryModule, NestjsQueryTypeOrmModule.forFeature([MediaEntity])],
      services: [MediaService],
      resolvers: [
        {
          DTOClass: MediaEntity,
          EntityClass: MediaEntity,
          ServiceClass: MediaService,
          read: { decorators: [IsPublic()] },
          create: { disabled: true },
          update: { disabled: true },
        },
      ],
    }),
  ],
  providers: [MediaResolver, MediaService],
  exports: [MediaService],
})
export class MediaModule {}
