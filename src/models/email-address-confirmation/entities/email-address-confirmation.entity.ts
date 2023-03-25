import { FilterableField, FilterableRelation } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { AfterLoad, Column, Entity, JoinColumn, OneToOne } from "typeorm";
import { BaseEntity } from "../../base.entity";
import { User } from "../../user/entities/user.entity";

@FilterableRelation("user", () => User)
@ObjectType()
@Entity()
export class EmailAddressConfirmation extends BaseEntity {
  @FilterableField(() => ID)
  @Column()
  userId!: number;

  @OneToOne(() => User, { onUpdate: "CASCADE", onDelete: "CASCADE" })
  @JoinColumn()
  user!: User;

  @FilterableField()
  @Column()
  email!: string;

  @FilterableField()
  @Column()
  token!: string;

  @FilterableField()
  @Column()
  expiresAt!: Date;

  @FilterableField()
  expired!: boolean;

  @AfterLoad()
  isExpired() {
    this.expired = this.createdAt.getTime() < this.expiresAt.getTime();
  }
}
