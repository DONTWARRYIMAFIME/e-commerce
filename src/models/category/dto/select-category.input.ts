import { Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { CartEntity } from "../../cart/entities/cart.entity";

@InputType()
export class SelectCategoryInput implements Pick<CartEntity, "id"> {
  @IsUUIDI18N()
  @Field()
  id!: Id;
}
