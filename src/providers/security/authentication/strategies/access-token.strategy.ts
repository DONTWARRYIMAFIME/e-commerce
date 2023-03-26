import { Injectable } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import { ExtractJwt, Strategy } from "passport-jwt";
import { decodeFromBase64 } from "../../../../common/helpers/base64.helper";
import { SecurityConfigService } from "../../../../config/security/security.service";
import { CachedUser } from "../../authorization/types/request-user.interface";
import { AuthenticationType } from "../authentication.enum";
import { TokenPayload } from "../types/token-payload.interface";

@Injectable()
export class AccessTokenStrategy extends PassportStrategy(Strategy, AuthenticationType.JWT_ACCESS) {
  constructor(private readonly config: SecurityConfigService) {
    const publicKey = decodeFromBase64(config.accessTokenPublicKey);

    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: publicKey,
      algorithms: ["RS512"],
    });
  }

  public validate(payload: TokenPayload): CachedUser {
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const { iat, exp, ...user } = payload;
    return user;
  }
}
