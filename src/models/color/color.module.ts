import { Module } from "@nestjs/common";
import { NestjsQueryGraphQLModule, PagingStrategies } from "@ptc-org/nestjs-query-graphql";
import { NestjsQueryTypeOrmModule } from "@ptc-org/nestjs-query-typeorm";
import { IsPublic } from "../../providers/security/auth/decorators/is-public.decorator";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
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
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [AccessGuard],
          read: {
            decorators: [IsPublic()],
            defaultResultSize: 30,
          },
          create: {
            decorators: [CheckAbility(Actions.CREATE, ColorEntity)],
            many: { disabled: true },
          },
          update: {
            decorators: [CheckAbility(Actions.UPDATE, ColorEntity)],
            many: { disabled: true },
          },
          delete: {
            decorators: [CheckAbility(Actions.DELETE, ColorEntity)],
            many: { disabled: true },
          },
        },
      ],
    }),
  ],
  providers: [ColorService],
  exports: [ColorService],
})
export class ColorModule {}
