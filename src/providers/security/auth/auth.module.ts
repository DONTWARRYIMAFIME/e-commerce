import { Module } from "@nestjs/common";
import { APP_GUARD } from "@nestjs/core";
import { JwtModule } from "@nestjs/jwt";
import { PassportModule } from "@nestjs/passport";
import { SecurityConfigModule } from "../../../config/security/security.module";
import { RoleModule } from "../../../models/role/role.module";
import { UserHook } from "../../../models/user/hooks/user.hook";
import { CaslModule } from "../casl/casl.module";
import { AuthResolver } from "./auth.resolver";
import { AuthService } from "./auth.service";
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
    CaslModule.forRoot({
      getUserHook: UserHook,
    }),
  ],
  providers: [
    AuthResolver,
    AuthService,
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
export class AuthModule {}
