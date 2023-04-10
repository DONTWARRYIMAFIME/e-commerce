import { FilterableField } from "@nestjs-query/query-graphql";
import { ID } from "@nestjs/graphql";
import { Column, ManyToOne, Unique } from "typeorm";
import { Entity, ObjectType } from "../../../common/decorators";
import { FilterableRelation } from "../../../common/decorators/graphql/relation.decorator";
import { Id } from "../../../common/types/id.type";
import { AddressEntity } from "../../address/entities/address.entity";
import { BaseEntity } from "../../base.entity";
import { UserEntity } from "../../user/entities/user.entity";

@FilterableRelation("user", () => UserEntity)
@FilterableRelation("address", () => AddressEntity)
@ObjectType()
@Unique("UNQ_user_address", ["user", "address"])
@Entity()
export class UserAddressEntity extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  userId!: Id;

  @ManyToOne(() => UserEntity, {
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  user!: UserEntity;

  @FilterableField(() => ID)
  @Column()
  addressId!: Id;

  @ManyToOne(() => AddressEntity, {
    eager: true,
    cascade: true,
    onUpdate: "CASCADE",
    onDelete: "CASCADE",
  })
  address!: AddressEntity;
}
