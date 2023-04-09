import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { ColorService } from "./color.service";
import { CreateColorInput } from "./dto/create-color.input";
import { UpdateColorInput } from "./dto/update-color.input";
import { ColorEntity } from "./entities/color.entity";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([ColorEntity])],
      services: [ColorService],
      resolvers: [
        {
          DTOClass: ColorEntity,
          EntityClass: ColorEntity,
          CreateDTOClass: CreateColorInput,
          UpdateDTOClass: UpdateColorInput,
          ServiceClass: ColorService,
        },
      ],
    }),
  ],
  providers: [ColorService],
  exports: [ColorService],
})
export class ColorModule {}
