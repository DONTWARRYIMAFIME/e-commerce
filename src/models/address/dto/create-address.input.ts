import { CreateOneInputType, MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { IsOptional } from "class-validator";
import { Id } from "../../../common/types/id.type";
import { IsPostalCodeI18N, IsUUIDI18N, LengthI18N } from "../../../providers/i18n/i18n.decorators";
import { AddressEntity } from "../entities/address.entity";

@InputType()
export class CreateAddressInput implements Partial<AddressEntity> {
  @IsPostalCodeI18N()
  @Field()
  postalCode!: string;

  @IsOptional()
  @LengthI18N(2, 64)
  @Field({ nullable: true })
  state?: string;

  @IsOptional()
  @LengthI18N(2, 64)
  @Field({ nullable: true })
  street?: string;

  @IsOptional()
  @LengthI18N(1, 12)
  @Field({ nullable: true })
  building?: string;

  @IsUUIDI18N()
  @Field()
  countryId: Id;

  @IsUUIDI18N()
  @Field()
  cityId: Id;
}

@InputType()
export class CreateOneAddressInputType extends CreateOneInputType("address", CreateAddressInput) {}

@ArgsType()
export class CreateOneAddressArgsType extends MutationArgsType(CreateOneAddressInputType) {}
