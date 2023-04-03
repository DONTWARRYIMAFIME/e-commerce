import { Field, InputType } from "@nestjs/graphql";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { WishlistEntity } from "../entities/wishlist.entity";

@InputType()
export class CreateWishlistInput implements Partial<WishlistEntity> {
  @IsUUIDI18N()
  @Field()
  userId: string;
}
