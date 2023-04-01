import { Injectable } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import { omit } from "lodash";
import { Strategy } from "passport-jwt";
import { decodeFromBase64 } from "../../../../common/helpers/base64.helper";
import { SecurityConfigService } from "../../../../config/security/security.service";
import { CachedUser } from "../../authorization/types/request-user.interface";
import { AuthenticationType } from "../authentication.enum";
import { AuthenticationCookieService } from "../cookie.service";
import { TokenPayload } from "../types/token-payload.interface";

@Injectable()
export class RefreshTokenStrategy extends PassportStrategy(Strategy, AuthenticationType.JWT_REFRESH) {
  constructor(private readonly cookiesService: AuthenticationCookieService, private readonly config: SecurityConfigService) {
    const publicKey = decodeFromBase64(config.refreshTokenPublicKey);

    super({
      jwtFromRequest: cookiesService.readRefreshToken,
      ignoreExpiration: false,
      secretOrKey: publicKey,
      algorithms: ["RS512"],
    });
  }

  public validate(payload: TokenPayload): CachedUser {
    return omit(payload, "iat", "exp");
  }
}
