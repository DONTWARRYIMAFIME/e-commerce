import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CurrencyModule } from "../currency/currency.module";
import { CreatePriceInput } from "./dto/create-price.input";
import { UpdatePriceInput } from "./dto/update-price.input";
import { PriceEntity } from "./entities/price.entity";
import { PriceService } from "./price.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [CurrencyModule, NestjsQueryTypeOrmModule.forFeature([PriceEntity])],
      services: [PriceService],
      resolvers: [
        {
          DTOClass: PriceEntity,
          EntityClass: PriceEntity,
          CreateDTOClass: CreatePriceInput,
          UpdateDTOClass: UpdatePriceInput,
          ServiceClass: PriceService,
        },
      ],
    }),
  ],
  providers: [PriceService],
  exports: [PriceService],
})
export class PriceModule {}
