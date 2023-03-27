import { FilterableField } from "@nestjs-query/query-graphql";
import { Column, Index, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { BaseEntity } from "../../base.entity";

@ObjectType()
@Unique("UNQ_email_address_address", ["address"])
@Index("INX_email_address_email_name", ["address", "name"])
@Entity()
export class EmailAddressEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 192 })
  address!: string;

  @FilterableField({ nullable: true })
  @Column({ length: 256, nullable: true })
  name!: string;

  @FilterableField()
  @Column({ default: false })
  verified!: boolean;
}
