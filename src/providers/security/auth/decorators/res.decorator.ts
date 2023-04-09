import { createParamDecorator, ExecutionContext } from "@nestjs/common";
import { GqlExecutionContext } from "@nestjs/graphql";
import { GqlContextType } from "../../../../common/types/context.type";

export const Res = createParamDecorator((data: unknown, context: ExecutionContext) => {
  switch (context.getType<GqlContextType>()) {
    case "http":
      return context.switchToHttp().getRequest();
    case "graphql":
      return GqlExecutionContext.create(context).getContext().res;
  }
});
