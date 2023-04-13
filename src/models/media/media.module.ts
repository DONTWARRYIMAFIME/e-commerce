import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
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
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, MediaEntity)],
          },
          create: { disabled: true },
          update: { disabled: true },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, MediaEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [MediaResolver, MediaService],
  exports: [MediaService],
})
export class MediaModule {}
