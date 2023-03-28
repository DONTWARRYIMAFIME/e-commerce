import { AnyClass, AnyObject } from "@casl/ability/dist/types/types";
import { UseAbility as NestUseAbility } from "nest-casl";
import { SubjectBeforeFilterHook, SubjectBeforeFilterTuple } from "nest-casl/dist/interfaces/hooks.interface";

export const UseAbility = (
  action?: string,
  subject?: AnyClass<AnyObject>,
  subjectHook?: AnyClass<SubjectBeforeFilterHook<AnyObject, Request>> | SubjectBeforeFilterTuple<AnyObject, Request>,
) => NestUseAbility(action, subject, subjectHook);
