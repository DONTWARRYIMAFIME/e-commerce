import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { JwtService as NestJwtService, JwtSignOptions } from "@nestjs/jwt";
import { decodeFromBase64 } from "../../../common/helpers/base64.helper";
import { TokenPayload } from "./types/token-payload.interface";

@Injectable()
export class JwtService {
  constructor(private readonly nestJwtService: NestJwtService, private readonly config: ConfigService) {}

  public createAccessToken(payload: TokenPayload): string {
    const accessTokenTTL = this.config.get<string>("ACCESS_TOKEN_TTL");
    const privateKey = this.config.get<string>("ACCESS_TOKEN_PRIVATE_KEY");
    return this.createJsonWebToken(payload, privateKey, { expiresIn: accessTokenTTL });
  }

  public createRefreshToken(payload: TokenPayload): string {
    const refreshTokenTTL = this.config.get<string>("REFRESH_TOKEN_TTL");
    const privateKey = this.config.get<string>("REFRESH_TOKEN_PRIVATE_KEY");
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
