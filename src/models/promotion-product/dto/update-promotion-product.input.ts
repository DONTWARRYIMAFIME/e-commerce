import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreatePromotionProductInput } from "./create-promotion-product.input";

@InputType()
export class UpdatePromotionProductInput extends OmitType(PartialType(CreatePromotionProductInput), ["productId", "promotionId"]) {}
