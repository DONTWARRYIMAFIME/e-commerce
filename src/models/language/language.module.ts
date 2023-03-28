import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CreateLanguageInput } from "./dto/create-language.input";
import { UpdateLanguageInput } from "./dto/update-language.input";
import { LanguageEntity } from "./entities/language.entity";
import { LanguageService } from "./language.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([LanguageEntity])],
      services: [LanguageService],
      resolvers: [
        {
          DTOClass: LanguageEntity,
          EntityClass: LanguageEntity,
          CreateDTOClass: CreateLanguageInput,
          UpdateDTOClass: UpdateLanguageInput,
          ServiceClass: LanguageService,
        },
      ],
    }),
  ],
  providers: [LanguageService],
  exports: [LanguageService],
})
export class LanguageModule {}
