import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CreateSizeInput } from "./dto/create-size.input";
import { UpdateSizeInput } from "./dto/update-size.input";
import { SizeEntity } from "./entities/size.entity";
import { SizeService } from "./size.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([SizeEntity])],
      services: [SizeService],
      resolvers: [
        {
          DTOClass: SizeEntity,
          EntityClass: SizeEntity,
          CreateDTOClass: CreateSizeInput,
          UpdateDTOClass: UpdateSizeInput,
          ServiceClass: SizeService,
        },
      ],
    }),
  ],
  providers: [SizeService],
  exports: [SizeService],
})
export class SizeModule {}
