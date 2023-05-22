import { InputType, OmitType, PartialType } from "@nestjs/graphql";
import { CreatePromotionInput } from "./create-promotion.input";

@InputType()
export class UpdatePromotionInput extends OmitType(PartialType(CreatePromotionInput), ["code"]) {}
