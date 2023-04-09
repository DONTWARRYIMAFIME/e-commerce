import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CurrencyService } from "./currency.service";
import { CreateCurrencyInput } from "./dto/create-currency.input";
import { UpdateCurrencyInput } from "./dto/update-currency.input";
import { CurrencyEntity } from "./entities/currency.entity";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([CurrencyEntity])],
      services: [CurrencyService],
      resolvers: [
        {
          DTOClass: CurrencyEntity,
          EntityClass: CurrencyEntity,
          CreateDTOClass: CreateCurrencyInput,
          UpdateDTOClass: UpdateCurrencyInput,
          ServiceClass: CurrencyService,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
      ],
    }),
  ],
  providers: [CurrencyService],
  exports: [CurrencyService],
})
export class CurrencyModule {}
