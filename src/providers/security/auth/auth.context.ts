import { ArgumentsHost } from "@nestjs/common";
import { AsyncLocalStorage } from "async_hooks";
import { getContextObject } from "../../../common/helpers/context.helper";
import { UserEntity } from "../../../models/user/entities/user.entity";

export class AuthContext {
  private static storage = new AsyncLocalStorage<AuthContext>();
  private static counter = 1;
  readonly id = AuthContext.counter++;

  constructor(readonly user: UserEntity) {}

  static create(ctx: AuthContext, next: (...args: any[]) => void): void {
    this.storage.run(ctx, next);
  }

  static current(context?: ArgumentsHost): AuthContext | undefined {
    const auth = this.storage.getStore() as AuthContext | undefined;

    if (!auth && !!context) {
      return getContextObject(context)?.auth;
    }

    return auth;
  }
}
