import { Injectable } from "@nestjs/common";
import { JwtService as NestJwtService, JwtSignOptions } from "@nestjs/jwt";
import { decodeFromBase64 } from "../../../common/helpers/base64.helper";
import { SecurityConfigService } from "../../../config/security/security.service";
import { TokenPayload } from "./types/token-payload.interface";

@Injectable()
export class JwtService {
  constructor(private readonly nestJwtService: NestJwtService, private readonly config: SecurityConfigService) {}

  public createAccessToken(payload: TokenPayload): string {
    const accessTokenTTL = this.config.accessTokenTTL;
    const privateKey = this.config.accessTokenPrivateKey;
    return this.createJsonWebToken(payload, privateKey, { expiresIn: accessTokenTTL });
  }

  public createRefreshToken(payload: TokenPayload): string {
    const refreshTokenTTL = this.config.refreshTokenTTL;
    const privateKey = this.config.refreshTokenPrivateKey;
    return this.createJsonWebToken(payload, privateKey, { expiresIn: refreshTokenTTL });
  }

  private createJsonWebToken(object: TokenPayload, privateKey: string, options?: JwtSignOptions) {
    const secret = decodeFromBase64(privateKey);

    return this.nestJwtService.sign(object, {
      ...(options && options),
      secret,
      algorithm: "RS512",
    });
  }
}
