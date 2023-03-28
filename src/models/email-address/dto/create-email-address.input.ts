import { Field, InputType } from "@nestjs/graphql";
import { IsOptional, Length } from "class-validator";
import { IsBooleanI18N, IsEmailI18N } from "../../../providers/i18n/i18n.decorators";
import { EmailAddressEntity } from "../entities/email-address.entity";

@InputType()
export class CreateEmailAddressInput implements Partial<EmailAddressEntity> {
  @IsEmailI18N()
  @Length(2, 128)
  @Field()
  address!: string;

  @IsEmailI18N()
  @Length(2, 256)
  @Field()
  name!: string;

  @IsOptional()
  @IsBooleanI18N()
  verified?: boolean;
}
