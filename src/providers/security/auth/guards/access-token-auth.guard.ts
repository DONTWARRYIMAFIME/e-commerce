import { CanActivate, ExecutionContext, Injectable } from "@nestjs/common";
import { Reflector } from "@nestjs/core";
import { GqlContextType, GqlExecutionContext } from "@nestjs/graphql";
import { AuthGuard } from "@nestjs/passport";
import { AuthenticationType } from "../auth.enum";
import { IS_PUBLIC } from "../decorators/is-public.decorator";

@Injectable()
export class AccessTokenAuthGuard extends AuthGuard(AuthenticationType.JWT_ACCESS) implements CanActivate {
  constructor(readonly reflector: Reflector) {
    super();
  }

  canActivate(context: ExecutionContext) {
    const isPublic = this.reflector.get<boolean>(IS_PUBLIC, context.getHandler());

    if (isPublic) {
      return true;
    }

    return super.canActivate(context);
  }

  getRequest(context: ExecutionContext) {
    switch (context.getType<GqlContextType>()) {
      case "graphql":
        const ctx = GqlExecutionContext.create(context);
        return ctx.getContext().req;
    }
  }
}
