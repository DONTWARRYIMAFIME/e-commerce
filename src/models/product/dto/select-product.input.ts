import { MutationArgsType } from "@nestjs-query/query-graphql";
import { ArgsType, Field, InputType } from "@nestjs/graphql";
import { Id } from "../../../common/types/id.type";
import { IsUUIDI18N } from "../../../providers/i18n/i18n.decorators";
import { ProductEntity } from "../entities/product.entity";

@InputType()
export class SelectProductInput implements Pick<ProductEntity, "id"> {
  @IsUUIDI18N()
  @Field()
  id!: Id;
}

@ArgsType()
export class SelectProductArgsType extends MutationArgsType(SelectProductInput) {}
