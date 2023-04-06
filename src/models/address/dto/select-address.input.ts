import { Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { AddressEntity } from "../entities/address.entity";

@InputType()
export class SelectAddressInput implements Partial<AddressEntity> {
  @IsUUIDI18N()
  @Field()
  id!: Id;
}
