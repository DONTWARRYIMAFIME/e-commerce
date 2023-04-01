/* eslint-disable */
import {
  IsBoolean,
  IsEmail, IsEnum,
  IsHexColor,
  IsNotEmpty,
  IsPositive,
  IsUppercase,
  IsUUID,
  Length,
  MaxLength,
  MinLength,
  UUIDVersion,
  ValidationOptions,
} from "class-validator";
import { i18nValidationMessage } from "nestjs-i18n";
import ValidatorJS from "validator";
import { IsBigInt, IsSnakeCase } from "../../common/decorators";
import { I18nTranslations } from "./i18n.generated";

export const IsEmailI18N = (options?: ValidatorJS.IsEmailOptions, validationOptions?: ValidationOptions) =>
  IsEmail({ ...options }, { ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.IS_EMAIL") });
export const IsHexColorI18N = (validationOptions?: ValidationOptions) =>
  IsHexColor({ ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.IS_HEX_COLOR") });
export const IsSnakeCaseI18N = (validationOptions?: ValidationOptions) =>
  IsSnakeCase({ ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.IS_SNAKE_CASE") });
export const IsUpperCaseI18N = (validationOptions?: ValidationOptions) =>
  IsUppercase({ ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.IS_UPPER_CASE") });
export const MinLengthI18N = (min: number, validationOptions?: ValidationOptions) =>
  MinLength(min, { ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.MIN_LENGTH") });
export const MaxLengthI18N = (min: number, validationOptions?: ValidationOptions) =>
  MaxLength(min, { ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.MAX_LENGTH") });
export const LengthI18N = (min: number, max: number, validationOptions?: ValidationOptions) =>
  Length(min, max, { ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.LENGTH") });
export const IsBigIntI18N = (validationOptions?: ValidationOptions) =>
  IsBigInt({ ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.IS_BIG_INT") });
export const IsBooleanI18N = (validationOptions?: ValidationOptions) =>
  IsBoolean({ ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.IS_BOOLEAN") });
export const IsNotEmptyI18N = (validationOptions?: ValidationOptions) =>
  IsNotEmpty({ ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.IS_NOT_EMPTY") });

export const IsUUIDI18N = (version?: UUIDVersion, validationOptions?: ValidationOptions) =>
  IsUUID(version, { ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.IS_UUID") });

export const IsPositiveI18N = (validationOptions?: ValidationOptions) =>
  IsPositive({ ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.IS_POSITIVE") });

export const IsEnumI18N = (entity: object, validationOptions?: ValidationOptions) =>
  IsEnum(entity, { ...validationOptions, message: i18nValidationMessage<I18nTranslations>("validation.IS_ENUM") });
