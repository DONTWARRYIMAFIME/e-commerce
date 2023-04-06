import { FilterableField } from "@nestjs-query/query-graphql";
import { Field, InputType } from "@nestjs/graphql";
import { IsUppercase, Length } from "class-validator";
import { IsEnumI18N } from "../../../providers/i18n/i18n.decorators";
import { SizeEntity } from "../entities/size.entity";
import { Sizes } from "../enums/size.enum";

@InputType()
export class CreateSizeInput implements Partial<SizeEntity> {
  @IsEnumI18N(Sizes)
  @FilterableField(() => Sizes)
  code!: Sizes;

  @Length(1, 3)
  @IsUppercase()
  @Field()
  name!: string;
}
