import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { BrandService } from "./brand.service";
import { CreateBrandInput } from "./dto/create-brand.input";
import { UpdateBrandInput } from "./dto/update-brand.input";
import { BrandEntity } from "./entities/brand.entity";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([BrandEntity])],
      services: [BrandService],
      resolvers: [
        {
          DTOClass: BrandEntity,
          EntityClass: BrandEntity,
          CreateDTOClass: CreateBrandInput,
          UpdateDTOClass: UpdateBrandInput,
          ServiceClass: BrandService,
        },
      ],
    }),
  ],
  providers: [BrandService],
  exports: [BrandService],
})
export class BrandModule {}
