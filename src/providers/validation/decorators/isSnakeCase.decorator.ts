import { registerDecorator, ValidationOptions } from "class-validator";

export const IS_SNAKE_CASE = "isSnakeCase";

export function IsSnakeCase(validationOptions?: ValidationOptions) {
  return function (object: object, propertyName: string) {
    registerDecorator({
      name: IS_SNAKE_CASE,
      target: object.constructor,
      propertyName: propertyName,
      options: validationOptions,
      validator: {
        validate(value: any) {
          const regex = /[a-zA-Z]+(_[a-zA-Z]+)*/gm;
          return typeof value === "string" && regex.test(value);
        },
        defaultMessage: () => "Value should be in a snake case",
      },
    });
  };
}
