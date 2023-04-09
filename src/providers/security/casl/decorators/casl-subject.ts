import { createParamDecorator, ExecutionContext } from "@nestjs/common";
import { ContextProxy } from "../proxies/context.proxy";
import { SubjectProxy } from "../proxies/subject.proxy";

export const CaslSubject = createParamDecorator(async (data: unknown, context: ExecutionContext) => {
  return new SubjectProxy(await ContextProxy.create(context).getRequest());
});
