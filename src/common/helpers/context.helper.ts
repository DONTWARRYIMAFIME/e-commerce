import { ArgumentsHost, ExecutionContext } from "@nestjs/common";

export function getContextObject(context?: ExecutionContext | ArgumentsHost): any {
  const contextType = context?.getType<string>() ?? "undefined";

  switch (contextType) {
    case "http":
      return context.switchToHttp().getRequest();
    case "graphql":
      return context.getArgs()[2];
    case "rpc":
      return context.switchToRpc().getContext();
  }
}
