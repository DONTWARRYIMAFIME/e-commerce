import { Injectable } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import { Strategy } from "passport-jwt";
import { decodeFromBase64 } from "../../../../common/helpers/base64.helper";
import { SecurityConfigService } from "../../../../config/security/security.service";
import { UserEntity } from "../../../../models/user/entities/user.entity";
import { UserService } from "../../../../models/user/user.service";
import { AuthCookieService } from "../auth-cookie.service";
import { AuthenticationType } from "../auth.enum";
import { TokenPayload } from "../types/token-payload.interface";

@Injectable()
export class RefreshTokenStrategy extends PassportStrategy(Strategy, AuthenticationType.JWT_REFRESH) {
  constructor(private readonly cookiesService: AuthCookieService, private readonly config: SecurityConfigService, private readonly userService: UserService) {
    const publicKey = decodeFromBase64(config.refreshTokenPublicKey);

    super({
      jwtFromRequest: cookiesService.readRefreshToken,
      ignoreExpiration: false,
      secretOrKey: publicKey,
      algorithms: ["RS512"],
    });
  }

  public validate(payload: TokenPayload): Promise<UserEntity> {
    return this.userService.findById(payload.sub);
  }
}
