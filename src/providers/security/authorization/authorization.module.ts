import { DynamicModule, Module } from "@nestjs/common";
import { APP_GUARD } from "@nestjs/core";
import { AccessService, AuthorizableRequest, AuthorizableUser, CaslModule as NestCaslModule, OptionsForRoot } from "nest-casl";
import { CaslConfig } from "nest-casl/dist/casl.config";
import { CASL_FEATURE_OPTIONS, CASL_ROOT_OPTIONS } from "nest-casl/dist/casl.constants";
import { AbilityFactory } from "nest-casl/dist/factories/ability.factory";
import { AccessGuard } from "./guards/access.guard";
import { permissions } from "./permission.factory";

@Module({
  providers: [
    AccessService,
    AbilityFactory,
    {
      provide: CASL_FEATURE_OPTIONS,
      useValue: { permissions },
    },
    {
      provide: APP_GUARD,
      useClass: AccessGuard,
    },
  ],
})
export class AuthorizationModule extends NestCaslModule {
  static forRoot<Roles extends string = string, User extends AuthorizableUser<unknown, unknown> = AuthorizableUser<Roles>, Request = AuthorizableRequest<User>>(
    options: OptionsForRoot<Roles, User, Request>,
  ): DynamicModule {
    Reflect.defineMetadata(CASL_ROOT_OPTIONS, options, CaslConfig);
    return {
      module: AuthorizationModule,
    };
  }
}
