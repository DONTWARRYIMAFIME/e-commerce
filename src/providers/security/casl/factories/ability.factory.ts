import { createMongoAbility, MongoAbility, RawRuleOf } from "@casl/ability";
import { Injectable } from "@nestjs/common";
import { Actions } from "../actions.enum";

export type Subjects = string;
export type Abilities = [Actions, Subjects];
export type AppAbility = MongoAbility<Abilities>;

@Injectable()
export class AbilityFactory {
  public createAbility(rules: RawRuleOf<AppAbility>[]): AppAbility {
    return createMongoAbility(rules);
  }
}
