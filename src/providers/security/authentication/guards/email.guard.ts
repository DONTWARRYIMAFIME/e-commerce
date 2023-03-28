import { ExecutionContext, Injectable } from "@nestjs/common";
import { GqlExecutionContext } from "@nestjs/graphql";
import { AuthGuard } from "@nestjs/passport";
import { AuthenticationType } from "../authentication.enum";

@Injectable()
export class EmailAuthGuard extends AuthGuard(AuthenticationType.EMAIL) {
  public getRequest(context: ExecutionContext) {
    const ctx = GqlExecutionContext.create(context);
    const request = ctx.getContext().req;

    request.body = ctx.getArgs().input;
    return request;
  }
}
