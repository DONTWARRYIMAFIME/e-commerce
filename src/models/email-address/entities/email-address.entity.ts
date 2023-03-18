import { FilterableField } from "@nestjs-query/query-graphql";
import { ObjectType } from "@nestjs/graphql";
import { Column, Entity, Index, Unique } from "typeorm";
import { BaseEntity } from "../../base.entity";

@ObjectType()
@Unique("UNQ_email_address_email", ["email"])
@Unique("UNQ_email_address_display_name", ["displayName"])
@Index("INX_email_address_email_name", ["email", "displayName"])
@Entity()
export class EmailAddress extends BaseEntity {
  @FilterableField()
  @Column({ length: 192 })
  email!: string;

  @FilterableField({ nullable: true })
  @Column({ length: 256, nullable: true })
  displayName!: string;

  @FilterableField()
  @Column({ default: false })
  verified!: boolean;
}
