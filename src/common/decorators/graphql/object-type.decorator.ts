import { ObjectType as DefaultObjectType } from "@nestjs/graphql";
import { ObjectTypeOptions } from "@nestjs/graphql/dist/decorators/object-type.decorator";
import { formatEntityName } from "../../helpers/entity-name.formatter";

export function ObjectType(name?: string, options?: ObjectTypeOptions) {
  return function (target: any) {
    const originalDecorator = DefaultObjectType(formatEntityName(target.name || name), options);
    return originalDecorator(target);
  };
}
