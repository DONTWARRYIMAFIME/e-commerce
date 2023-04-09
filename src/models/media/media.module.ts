import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { IsPublic } from "../../providers/security/auth/decorators/is-public.decorator";
import { CloudinaryModule } from "../../providers/storage/cloudinary/cloudinary.module";
import { MediaEntity } from "./entities/media.entity";
import { MediaResolver } from "./media.resolver";
import { MediaService } from "./media.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
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
