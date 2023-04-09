import { CanActivate, ExecutionContext, Injectable } from "@nestjs/common";
import { GqlContextType, GqlExecutionContext } from "@nestjs/graphql";
import { AuthGuard } from "@nestjs/passport";
import { AuthenticationType } from "../auth.enum";

@Injectable()
export class RefreshTokenAuthGuard extends AuthGuard(AuthenticationType.JWT_REFRESH) implements CanActivate {
  getRequest(context: ExecutionContext) {
    switch (context.getType<GqlContextType>()) {
      case "graphql":
        const ctx = GqlExecutionContext.create(context);
        return ctx.getContext().req;
    }
  }
}
