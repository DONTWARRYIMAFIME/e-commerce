import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { BrandService } from "./brand.service";
import { CreateBrandInput } from "./dto/create-brand.input";
import { UpdateBrandInput } from "./dto/update-brand.input";
import { BrandEntity } from "./entities/brand.entity";
import { BrandHook } from "./hooks/brand.hook";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([BrandEntity])],
      services: [BrandService],
      resolvers: [
        {
          DTOClass: BrandEntity,
          EntityClass: BrandEntity,
          CreateDTOClass: CreateBrandInput,
          UpdateDTOClass: UpdateBrandInput,
          ServiceClass: BrandService,
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, BrandEntity)],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, BrandEntity)],
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, BrandEntity, BrandHook)],
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, BrandEntity, BrandHook)],
          },
        },
      ],
    }),
  ],
  providers: [BrandService],
  exports: [BrandService],
})
export class BrandModule {}
