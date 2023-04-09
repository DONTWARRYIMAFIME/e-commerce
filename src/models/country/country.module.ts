import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CountryService } from "./country.service";
import { CreateCountryInput } from "./dto/create-country.input";
import { UpdateCountryInput } from "./dto/update-country.input";
import { CountryEntity } from "./entities/country.entity";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([CountryEntity])],
      services: [CountryService],
      resolvers: [
        {
          DTOClass: CountryEntity,
          EntityClass: CountryEntity,
          CreateDTOClass: CreateCountryInput,
          UpdateDTOClass: UpdateCountryInput,
          ServiceClass: CountryService,
        },
      ],
    }),
  ],
  providers: [CountryService],
  exports: [CountryService],
})
export class CountryModule {}
