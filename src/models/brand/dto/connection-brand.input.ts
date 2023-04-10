import { QueryArgsType } from "@nestjs-query/query-graphql";
import { BrandEntity } from "../entities/brand.entity";

export const BrandQueryArgs = QueryArgsType(BrandEntity);
export const BrandConnection = BrandQueryArgs.ConnectionType;
