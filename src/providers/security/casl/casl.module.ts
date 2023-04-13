import { DynamicModule, Global, Module } from "@nestjs/common";
import { AccessService } from "./access.service";
import { CaslConfig } from "./casl.config";
import { CASL_FEATURE_OPTIONS, CASL_ROOT_OPTIONS } from "./casl.constants";
import { AbilityFactory } from "./factories/ability.factory";
import { AuthorizableUser, Permission } from "./interfaces/authorizable-user.interface";
import { OptionsForRoot } from "./interfaces/options.interface";
import { AuthorizableRequest } from "./interfaces/request.interface";
import { UserProxy } from "./proxies/user.proxy";

@Global()
@Module({
  imports: [],
  providers: [
    AccessService,
    AbilityFactory,
    UserProxy,
    {
      provide: CASL_FEATURE_OPTIONS,
      useValue: {},
    },
  ],
  exports: [AbilityFactory, AccessService, UserProxy],
})
export class CaslModule {
  static forRoot<
    Permissions extends Permission<unknown, unknown, unknown> = Permission,
    User extends AuthorizableUser<unknown, unknown> = AuthorizableUser<Permissions>,
    Request = AuthorizableRequest<User>,
  >(options: OptionsForRoot<Permissions, User, Request>): DynamicModule {
    Reflect.defineMetadata(CASL_ROOT_OPTIONS, options, CaslConfig);
    return {
      module: CaslModule,
    };
  }
}
