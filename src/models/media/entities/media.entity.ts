import { FilterableField } from "@ptc-org/nestjs-query-graphql";
import { Column, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { BaseEntity } from "../../base.entity";
import { MediaType } from "../media.enum";

@Authorize()
@ObjectType()
@Unique("UNQ_media_secure_id", ["publicId"])
@Unique("UNQ_media_url", ["url"])
@Entity()
export class MediaEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 256 })
  publicId!: string;

  @FilterableField()
  @Column({ length: 256 })
  filename!: string;

  @FilterableField()
  @Column({ type: "text" })
  url!: string;

  @FilterableField({ nullable: true })
  @Column({ nullable: true })
  width?: number;

  @FilterableField({ nullable: true })
  @Column({ nullable: true })
  height?: number;

  @FilterableField(() => MediaType)
  @Column()
  format!: MediaType;
}
