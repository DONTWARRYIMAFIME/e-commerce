import { AnyClass, AnyObject } from "@casl/ability/dist/types/types";
import { Actions } from "../actions.enum";
import { SubjectBeforeFilterHook, SubjectBeforeFilterTuple } from "./hooks.interface";
import { AuthorizableRequest } from "./request.interface";

export interface AbilityMetadata<Subject = AnyObject, Request = AuthorizableRequest> {
  action: Actions;
  subject: AnyClass<Subject>;
  subjectHook?: AnyClass<SubjectBeforeFilterHook<Subject, Request>> | SubjectBeforeFilterTuple<Subject, Request>;
}
