import { AnyClass, AnyObject } from "@casl/ability/dist/types/types";
import { UseAbility as NestUseAbility } from "nest-casl";
import { SubjectBeforeFilterHook, SubjectBeforeFilterTuple } from "nest-casl/dist/interfaces/hooks.interface";
import { Subjects } from "../permission.factory";

export const UseAbility = (
  action?: string,
  subject?: Subjects,
  subjectHook?: AnyClass<SubjectBeforeFilterHook<AnyObject, Request>> | SubjectBeforeFilterTuple<AnyObject, Request>,
) => NestUseAbility(action, subject as any, subjectHook);
