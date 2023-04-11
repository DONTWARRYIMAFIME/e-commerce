import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
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
          guards: [AccessGuard],
          read: {
            decorators: [CheckAbility(Actions.READ, SizeEntity)],
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
