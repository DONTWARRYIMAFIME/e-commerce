import { Module } from "@nestjs/common";
import { NestjsQueryGraphQLModule, PagingStrategies } from "@ptc-org/nestjs-query-graphql";
import { NestjsQueryTypeOrmModule } from "@ptc-org/nestjs-query-typeorm";
import { IsPublic } from "../../providers/security/auth/decorators/is-public.decorator";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
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
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [IsPublic()],
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, SizeEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, SizeEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, SizeEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [SizeService],
  exports: [SizeService],
})
export class SizeModule {}
