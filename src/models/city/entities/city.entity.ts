import { FilterableField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { Column, ManyToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { CountryEntity } from "../../country/entities/country.entity";

@FilterableRelation("country", () => CountryEntity)
@ObjectType()
@Unique("UNQ_city_name_and_county", ["name", "country"])
@Entity()
export class CityEntity extends BaseEntity {
  @FilterableField()
  @Column({ length: 128 })
  name!: string;

  @FilterableField(() => ID)
  @Column()
  countryId!: Id;

  @ManyToOne(() => CountryEntity, country => country.cities, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  country!: CountryEntity;
}
