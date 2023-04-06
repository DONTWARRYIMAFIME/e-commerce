import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CountryModule } from "../country/country.module";
import { CityService } from "./city.service";
import { CreateCityInput } from "./dto/create-city.input";
import { UpdateCityInput } from "./dto/update-city.input";
import { CityEntity } from "./entities/city.entity";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [CountryModule, NestjsQueryTypeOrmModule.forFeature([CityEntity])],
      services: [CityService],
      resolvers: [
        {
          DTOClass: CityEntity,
          EntityClass: CityEntity,
          CreateDTOClass: CreateCityInput,
          UpdateDTOClass: UpdateCityInput,
          ServiceClass: CityService,
        },
      ],
    }),
  ],
  providers: [CityService],
  exports: [CityService],
})
export class CityModule {}
