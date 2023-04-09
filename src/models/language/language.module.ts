import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CreateLanguageInput } from "./dto/create-language.input";
import { UpdateLanguageInput } from "./dto/update-language.input";
import { LanguageEntity } from "./entities/language.entity";
import { LanguageService } from "./language.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
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
