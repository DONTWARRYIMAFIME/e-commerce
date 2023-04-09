import { createParamDecorator, ExecutionContext } from "@nestjs/common";
import { GqlContextType, GqlExecutionContext } from "@nestjs/graphql";

export const Res = createParamDecorator((data: unknown, context: ExecutionContext) => {
  switch (context.getType<GqlContextType>()) {
    case "http":
      return context.switchToHttp().getRequest();
    case "graphql":
      const ctx = GqlExecutionContext.create(context);
      return ctx.getContext().res;
  }
});
