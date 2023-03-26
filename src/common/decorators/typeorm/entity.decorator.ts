import { Entity as DefaultEntity } from "typeorm";
import { EntityOptions } from "typeorm/decorator/options/EntityOptions";
import { formatEntityName } from "../../helpers/entity-name.formatter";
import { toSnakeCase } from "../../helpers/snake-case.helper";

export function Entity(options?: EntityOptions) {
  return function (target: any) {
    const originalDecorator = DefaultEntity({ name: toSnakeCase(formatEntityName(target.name)), ...options });
    return originalDecorator(target);
  };
}
