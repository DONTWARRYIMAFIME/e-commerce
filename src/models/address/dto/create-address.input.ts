import { Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { IsUUIDI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { AddressEntity } from "../entities/address.entity";

@InputType()
export class CreateAddressInput implements Partial<AddressEntity> {
  @LengthI18N(2, 16)
  @Field()
  postalCode: string;

  @IsOptional()
  @LengthI18N(2, 64)
  @Field({ nullable: true })
  state?: string;

  @IsOptional()
  @LengthI18N(2, 64)
  @Field({ nullable: true })
  street?: string;

  @IsOptional()
  @LengthI18N(2, 12)
  @Field({ nullable: true })
  building?: string;

  @IsUUIDI18N()
  @Field()
  cityId: string;
}
