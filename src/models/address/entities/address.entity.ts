import { FilterableField } from "@nestjs-query/query-graphql";
import { Field, ID } from "@nestjs/graphql";
import { AfterLoad, Column, Index, ManyToOne } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { Authorize } from "../../../common/decorators/graphql/authorize.decorator";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { BaseEntity } from "../../base.entity";
import { CityEntity } from "../../city/entities/city.entity";
import { CountryEntity } from "../../country/entities/country.entity";

@Authorize()
@FilterableRelation("city", () => CityEntity)
@FilterableRelation("country", () => CountryEntity)
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

  @FilterableField(() => ID)
  @Column()
  countryId!: Id;

  @ManyToOne(() => CountryEntity, {
    eager: true,
    cascade: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  country!: CountryEntity;

  @Field()
  formattedAddress!: string;

  @AfterLoad()
  private async afterLoad() {
    const city = await CityEntity.findOneOrFail({ where: { id: this.cityId }, relations: { country: true } });
    this.formattedAddress = [this.postalCode, city.country.name, this.state, city.name, `${this.street} ${this.building}`].join(", ");
  }
}
