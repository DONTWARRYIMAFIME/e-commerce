import { Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { UserAddressEntity } from "../entities/user-address.entity";

@InputType()
export class CreateUserAddressInput implements Partial<UserAddressEntity> {
  @IsUUIDI18N()
  @Field()
  userId!: Id;

  @IsUUIDI18N()
  @Field()
  addressId: Id;
}
