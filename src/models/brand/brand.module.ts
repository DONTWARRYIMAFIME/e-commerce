import { Module } from "@nestjs/common";
import { NestjsQueryGraphQLModule, PagingStrategies } from "@ptc-org/nestjs-query-graphql";
import { NestjsQueryTypeOrmModule } from "@ptc-org/nestjs-query-typeorm";
import { IsPublic } from "../../providers/security/auth/decorators/is-public.decorator";
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
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [IsPublic()],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, BrandEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, BrandEntity, BrandHook)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, BrandEntity, BrandHook)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [BrandService, BrandHook],
  exports: [BrandService],
})
export class BrandModule {}
