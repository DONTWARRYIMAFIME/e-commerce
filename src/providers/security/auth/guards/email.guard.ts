import { ExecutionContext, Injectable } from "@nestjs/common";
import { GqlContextType, GqlExecutionContext } from "@nestjs/graphql";
import { AuthGuard } from "@nestjs/passport";
import { AuthenticationType } from "../auth.enum";

@Injectable()
export class EmailAuthGuard extends AuthGuard(AuthenticationType.EMAIL) {
  public getRequest(context: ExecutionContext) {
    switch (context.getType<GqlContextType>()) {
      case "graphql":
        const ctx = GqlExecutionContext.create(context);
        const request = ctx.getContext().req;
        request.body = ctx.getArgs().input;
        return request;
    }
  }
}
