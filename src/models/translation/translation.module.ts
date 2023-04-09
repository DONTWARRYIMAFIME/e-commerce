import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CreateTranslationInput } from "./dto/create-translation.input";
import { UpdateTranslationInput } from "./dto/update-translation.input";
import { TranslationEntity } from "./entities/translation.entity";
import { TranslationService } from "./translation.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([TranslationEntity])],
      services: [TranslationService],
      resolvers: [
        {
          DTOClass: TranslationEntity,
          EntityClass: TranslationEntity,
          CreateDTOClass: CreateTranslationInput,
          UpdateDTOClass: UpdateTranslationInput,
          ServiceClass: TranslationService,
        },
      ],
    }),
  ],
  providers: [TranslationService],
  exports: [TranslationService],
})
export class TranslationModule {}
