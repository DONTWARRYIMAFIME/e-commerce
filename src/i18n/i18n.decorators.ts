import { IsBoolean, IsEmail, IsHexColor, IsNotEmpty, IsUppercase, Length, MaxLength, MinLength, ValidationOptions } from "class-validator";
import { i18nValidationMessage } from "nestjs-i18n";
import ValidatorJS from "validator";
import { IsBigInt } from "../common/decorators/validation/isBigInt.decorator";
import { IsSnakeCase } from "../common/decorators/validation/isSnakeCase.decorator";

export const IsEmailI18N = (options?: ValidatorJS.IsEmailOptions, validationOptions?: ValidationOptions) =>
  IsEmail({ ...options }, { ...validationOptions, message: i18nValidationMessage("validation.IS_EMAIL") });

export const IsHexColorI18N = (validationOptions?: ValidationOptions) => IsHexColor({ ...validationOptions, message: i18nValidationMessage("validation.IS_HEX_COLOR") });
export const IsSnakeCaseI18N = (validationOptions?: ValidationOptions) => IsSnakeCase({ ...validationOptions, message: i18nValidationMessage("validation.IS_SNAKE_CASE") });
export const IsUpperCaseI18N = (validationOptions?: ValidationOptions) => IsUppercase({ ...validationOptions, message: i18nValidationMessage("validation.IS_UPPER_CASE") });
export const MinLengthI18N = (min: number, validationOptions?: ValidationOptions) =>
  MinLength(min, { ...validationOptions, message: i18nValidationMessage("validation.MIN_LENGTH") });
export const MaxLengthI18N = (min: number, validationOptions?: ValidationOptions) =>
  MaxLength(min, { ...validationOptions, message: i18nValidationMessage("validation.MAX_LENGTH") });
export const LengthI18N = (min: number, max: number, validationOptions?: ValidationOptions) =>
  Length(min, max, { ...validationOptions, message: i18nValidationMessage("validation.LENGTH") });
export const IsBigIntI18N = (validationOptions?: ValidationOptions) => IsBigInt({ ...validationOptions, message: i18nValidationMessage("validation.IS_BIG_INT") });
export const IsBooleanI18N = (validationOptions?: ValidationOptions) => IsBoolean({ ...validationOptions, message: i18nValidationMessage("validation.IS_BOOLEAN") });
export const IsNotEmptyI18N = (validationOptions?: ValidationOptions) => IsNotEmpty({ ...validationOptions, message: i18nValidationMessage("validation.IS_NOT_EMPTY") });
