import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CountryModule } from "../country/country.module";
import { CreateCityInput } from "./dto/create-city.input";
import { UpdateCityInput } from "./dto/update-city.input";
import { CityEntity } from "./entities/city.entity";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [CountryModule, NestjsQueryTypeOrmModule.forFeature([CityEntity])],
      resolvers: [
        {
          DTOClass: CityEntity,
          EntityClass: CityEntity,
          CreateDTOClass: CreateCityInput,
          UpdateDTOClass: UpdateCityInput,
        },
      ],
    }),
  ],
})
export class CityModule {}
