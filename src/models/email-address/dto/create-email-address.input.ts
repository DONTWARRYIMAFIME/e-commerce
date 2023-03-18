import { Field, InputType } from "@nestjs/graphql";
import { IsOptional, Length } from "class-validator";
import { IsBooleanI18N, IsEmailI18N } from "../../../i18n/i18n.decorators";
import { EmailAddress } from "../entities/email-address.entity";

@InputType()
export class CreateEmailAddressInput implements Partial<EmailAddress> {
  @IsEmailI18N()
  @Length(2, 128)
  @Field()
  email!: string;

  @IsEmailI18N()
  @Length(2, 256)
  @Field()
  displayName!: string;

  @IsOptional()
  @IsBooleanI18N()
  verified?: boolean;
}
