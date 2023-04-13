import { FilterableField } from "@nestjs-query/query-graphql";
import { Unique, Column } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { BaseEntity } from "../../base.entity";

@Authorize()
@ObjectType()
@Unique("UNQ_color_code", ["code"])
@Entity()
export class ColorEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 32 })
  code!: string;

  @FilterableField()
  @Column({ length: 64 })
  name!: string;

  @FilterableField()
  @Column({ length: 7 })
  hex!: string;
}
