import { subject } from "@casl/ability";
import { AnyObject } from "@casl/ability/dist/types/types";
import { Injectable } from "@nestjs/common";
import { CaslConfig } from "./casl.config";
import { AbilityFactory } from "./factories/ability.factory";
import { AbilityMetadata } from "./interfaces/ability-metadata.interface";
import { AuthorizableRequest } from "./interfaces/request.interface";
import { ConditionsProxy } from "./proxies/conditions.proxy";
import { RequestProxy } from "./proxies/request.proxy";
import { UserProxy } from "./proxies/user.proxy";

@Injectable()
export class AccessService {
  constructor(private abilityFactory: AbilityFactory) {}

  public async canActivateAbility<Subject = AnyObject>(request: AuthorizableRequest, ability?: AbilityMetadata<Subject>): Promise<boolean> {
    const { getUserFromRequest } = CaslConfig.getRootOptions();

    const userProxy = new UserProxy(request, getUserFromRequest);
    const req = new RequestProxy(request);

    // No ability = public endpoint
    if (!ability) {
      return true;
    }

    // Attempt to get user from request
    const user = userProxy.getFromRequest();

    // No user - no access
    if (!user) {
      return false;
    }

    console.log("user", user);

    const userAbilities = this.abilityFactory.createAbility(user.permissions as any);
    const relevantRules = userAbilities.rulesFor(ability.action, ability.subject.name);

    req.setConditions(new ConditionsProxy(userAbilities, ability.action, ability.subject));

    // If no relevant rules with conditions or no subject hook exists check against subject class
    if (!relevantRules.every(rule => rule.conditions) || !ability.subjectHook) {
      return userAbilities.can(ability.action, ability.subject.name);
    }

    // Otherwise try to obtain subject
    const subjectInstance = await req.getSubjectHook().run(request);
    req.setSubject(subjectInstance);

    if (!subjectInstance) {
      return userAbilities.can(ability.action, ability.subject.name);
    }

    // and match agains subject instance
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return userAbilities.can(ability.action, subject(ability.subject.name, subjectInstance) as any);
  }
}
