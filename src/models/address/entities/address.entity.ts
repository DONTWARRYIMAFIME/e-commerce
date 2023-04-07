import { FilterableField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { Column, Index, ManyToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { CityEntity } from "../../city/entities/city.entity";

@FilterableRelation("city", () => CityEntity)
@ObjectType()
@Index("INX_address_city", ["city"])
@Entity()
export class AddressEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 16 })
  postalCode!: string;

  @FilterableField({ nullable: true })
  @Column({ length: 64, nullable: true })
  state?: string;

  @FilterableField({ nullable: true })
  @Column({ length: 64, nullable: true })
  street?: string;

  @FilterableField({ nullable: true })
  @Column({ length: 12, nullable: true })
  building?: string;

  @FilterableField(() => ID)
  @Column()
  cityId!: Id;

  @ManyToOne(() => CityEntity, {
    eager: true,
    cascade: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  city!: CityEntity;
}
