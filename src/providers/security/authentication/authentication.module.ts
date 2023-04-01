import { Module } from "@nestjs/common";
import { APP_GUARD } from "@nestjs/core";
import { JwtModule } from "@nestjs/jwt";
import { PassportModule } from "@nestjs/passport";
import { SecurityConfigModule } from "../../../config/security/security.module";
import { UserEntity } from "../../../models/user/entities/user.entity";
import { UserHook } from "../../../models/user/hooks/user.hook";
import { AuthorizationModule } from "../authorization/authorization.module";
import { Roles } from "../authorization/role/role.enum";
import { RoleModule } from "../authorization/role/role.module";
import { AuthenticationResolver } from "./authentication.resolver";
import { AuthenticationService } from "./authentication.service";
import { AuthenticationCookieService } from "./cookie.service";
import { AccessTokenAuthGuard } from "./guards/access-token-auth.guard";
import { JwtService } from "./jwt.service";
import { AccessTokenStrategy } from "./strategies/access-token.strategy";
import { EmailStrategy } from "./strategies/email.strategy";
import { RefreshTokenStrategy } from "./strategies/refresh-token.strategy";

@Module({
  imports: [
    SecurityConfigModule,
    PassportModule,
    RoleModule,
    JwtModule.register({}),
    AuthorizationModule.forRoot<Roles, UserEntity>({
      superuserRole: Roles.ADMIN,
      getUserHook: UserHook,
    }),
  ],
  providers: [
    AuthenticationResolver,
    AuthenticationService,
    AuthenticationCookieService,
    JwtService,
    EmailStrategy,
    AccessTokenStrategy,
    RefreshTokenStrategy,
    {
      provide: APP_GUARD,
      useClass: AccessTokenAuthGuard,
    },
  ],
})
export class AuthenticationModule {}
