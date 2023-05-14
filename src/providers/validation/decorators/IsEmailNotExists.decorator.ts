import { registerDecorator, ValidationArguments, ValidationOptions, ValidatorConstraint, ValidatorConstraintInterface } from "class-validator";
import { UserService } from "../../../models/user/user.service";

@ValidatorConstraint({ async: true })
export class IsEmailNotExistsDecorator implements ValidatorConstraintInterface {
  constructor(private readonly userService: UserService) {}

  validate(email: string) {
    return this.userService.findOneByEmail(email).then(user => {
      return !user;
    });
  }

  public defaultMessage(validationArguments?: ValidationArguments): string {
    return `User with email ${validationArguments.value} already exists`;
  }
}

export function IsEmailNotExists(validationOptions?: ValidationOptions) {
  return function (object: object, propertyName: string) {
    registerDecorator({
      target: object.constructor,
      propertyName: propertyName,
      options: validationOptions,
      constraints: [],
      validator: IsEmailNotExistsDecorator,
    });
  };
}
