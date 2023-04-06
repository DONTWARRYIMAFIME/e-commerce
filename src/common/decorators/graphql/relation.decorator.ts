import {
  FilterableRelation as DefaultFilterableRelation,
  FilterableUnPagedRelation as DefaultFilterableUnPagedRelation,
  UnPagedRelation as DefaultUnPagedRelation,
} from "@nestjs-query/query-graphql";
import { RelationClassDecorator, RelationDecoratorOpts, RelationTypeFunc } from "@nestjs-query/query-graphql/dist/src/decorators/relation.decorator";

export const FilterableRelation = <DTO, Relation>(
  name: string,
  relationTypeFunc: RelationTypeFunc<Relation>,
  options?: RelationDecoratorOpts<Relation> | undefined,
): RelationClassDecorator<DTO> => DefaultFilterableRelation(name, relationTypeFunc, { disableUpdate: true, disableRemove: true, ...options });

export const UnPagedRelation = <DTO, Relation>(
  name: string,
  relationTypeFunc: RelationTypeFunc<Relation>,
  options?: RelationDecoratorOpts<Relation> | undefined,
): RelationClassDecorator<DTO> => DefaultUnPagedRelation(name, relationTypeFunc, { disableUpdate: true, disableRemove: true, ...options });

export const FilterableUnPagedRelation = <DTO, Relation>(
  name: string,
  relationTypeFunc: RelationTypeFunc<Relation>,
  options?: RelationDecoratorOpts<Relation> | undefined,
): RelationClassDecorator<DTO> => DefaultFilterableUnPagedRelation(name, relationTypeFunc, { disableUpdate: true, disableRemove: true, ...options });
