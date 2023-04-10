import { Filter } from "@nestjs-query/core";
import { InferConnectionTypeFromStrategy, PagingStrategies, ReadResolver } from "@nestjs-query/query-graphql";
import { ExtractPagingStrategy } from "@nestjs-query/query-graphql/dist/src/resolvers/resolver.interface";
import { CursorQueryArgsTypeOpts, QueryType } from "@nestjs-query/query-graphql/dist/src/types/query";
import { UseGuards } from "@nestjs/common";
import { Query, Resolver } from "@nestjs/graphql";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CaslConditions } from "../../providers/security/casl/decorators/casl-conditions";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { ConditionsProxy } from "../../providers/security/casl/proxies/conditions.proxy";
import { BrandService } from "./brand.service";
import { BrandConnection } from "./dto/connection-brand.input";
import { BrandEntity } from "./entities/brand.entity";

@Resolver()
export class BrandReadResolver extends ReadResolver(BrandEntity) {
  constructor(private readonly brandService: BrandService) {
    super(brandService);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.READ, BrandEntity)
  @Query(() => BrandConnection, { name: "brands" })
  public queryMany(
    query: QueryType<BrandEntity, PagingStrategies>,
    authorizeFilter?: Filter<BrandEntity>,
    @CaslConditions() conditions?: ConditionsProxy,
  ): Promise<InferConnectionTypeFromStrategy<BrandEntity, ExtractPagingStrategy<BrandEntity, CursorQueryArgsTypeOpts<BrandEntity>>>> {
    console.log(conditions);
    return super.queryMany(query, authorizeFilter);
  }
}
