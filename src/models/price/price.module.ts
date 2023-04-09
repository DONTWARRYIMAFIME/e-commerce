import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CreatePriceInput } from "./dto/create-price.input";
import { UpdatePriceInput } from "./dto/update-price.input";
import { PriceEntity } from "./entities/price.entity";
import { PriceService } from "./price.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([PriceEntity])],
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
