import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CaslGraphQLModule } from "../../providers/security/authorization/casl-graphql.module";
import { CreateSizeInput } from "./dto/create-size.input";
import { UpdateSizeInput } from "./dto/update-size.input";
import { SizeEntity } from "./entities/size.entity";
import { SizeService } from "./size.service";

@Module({
  imports: [
    CaslGraphQLModule.forFeature({
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
