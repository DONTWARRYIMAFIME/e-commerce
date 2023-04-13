import { createParamDecorator, ExecutionContext } from "@nestjs/common";
import { CaslConfig } from "../casl.config";
import { ContextProxy } from "../proxies/context.proxy";
import { UserProxy } from "../proxies/user.proxy";

export const CaslUser = createParamDecorator(async (data: unknown, context: ExecutionContext) => {
  return new UserProxy(await ContextProxy.create(context).getRequest(), CaslConfig.getRootOptions().getUserFromRequest);
});
