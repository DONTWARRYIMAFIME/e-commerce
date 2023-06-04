import { CanActivate, ExecutionContext, Injectable } from "@nestjs/common";
import { Reflector } from "@nestjs/core";
import { GqlExecutionContext } from "@nestjs/graphql";
import { AuthGuard } from "@nestjs/passport";
import { AuthenticationType } from "../auth.enum";
import { IS_PUBLIC } from "../decorators/is-public.decorator";

@Injectable()
export class AccessTokenAuthGuard extends AuthGuard(AuthenticationType.JWT_ACCESS) implements CanActivate {
  constructor(readonly reflector: Reflector) {
    super();
  }

  handleRequest(err: any, user: any, info: Error, context: ExecutionContext, status): any {
    const isPublic = this.reflector.get<boolean>(IS_PUBLIC, context.getHandler());

    if (isPublic) {
      return user;
    }

    return super.handleRequest(err, user, info, context, status);
  }

  getRequest(context: ExecutionContext) {
    const ctx = GqlExecutionContext.create(context);
    return ctx.getContext().req;
  }
}
