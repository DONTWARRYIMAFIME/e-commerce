import { buildMessage, ValidateBy, ValidationOptions } from "class-validator";
import matchesValidator from "validator/lib/matches";

export const IS_BIGINT = "isBigInt";

/**
 * Checks if the value is a BingInt
 */
export function isBigInt(value: number | string): boolean {
  return (typeof value === "number" || typeof value === "string") && (matchesValidator(`${value}`, /^[0-9]+$/) || matchesValidator(`${value}`, /^[0-9]+n+$/));
}

/**
 * Checks if the value is a BingInt
 * BigInt => simple number or string with 'n'
 * Ej:
 *      - "20221301083605n"
 *      - "20221301083605"
 *      -  20221301083605
 */
export function IsBigInt(validationOptions?: ValidationOptions): PropertyDecorator {
  return ValidateBy(
    {
      name: IS_BIGINT,
      validator: {
        validate: (value): boolean => isBigInt(value),
        defaultMessage: buildMessage(eachPrefix => eachPrefix + "$property must be a BigInt", validationOptions),
      },
    },
    validationOptions,
  );
}
