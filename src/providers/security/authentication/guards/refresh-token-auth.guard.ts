import { CanActivate, ExecutionContext, Injectable } from "@nestjs/common";
import { GqlExecutionContext } from "@nestjs/graphql";
import { AuthGuard } from "@nestjs/passport";
import { AuthenticationType } from "../authentication.enum";

@Injectable()
export class RefreshTokenAuthGuard extends AuthGuard(AuthenticationType.JWT_REFRESH) implements CanActivate {
  getRequest(context: ExecutionContext) {
    const ctx = GqlExecutionContext.create(context);
    return ctx.getContext().req;
  }
}
