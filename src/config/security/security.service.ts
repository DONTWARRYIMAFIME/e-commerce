import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import {
  ACCESS_TOKEN_PRIVATE_KEY,
  ACCESS_TOKEN_PUBLIC_KEY,
  ACCESS_TOKEN_TTL,
  REFRESH_TOKEN_COOKIE_TTL,
  REFRESH_TOKEN_PRIVATE_KEY,
  REFRESH_TOKEN_PUBLIC_KEY,
  REFRESH_TOKEN_TTL,
  SALT_LENGTH,
} from "./security.constants";

@Injectable()
export class SecurityConfigService {
  constructor(private configService: ConfigService) {}

  get saltLength(): number {
    return Number(this.configService.getOrThrow<string>(SALT_LENGTH));
  }

  get accessTokenPublicKey(): string {
    return this.configService.getOrThrow<string>(ACCESS_TOKEN_PUBLIC_KEY);
  }

  get accessTokenPrivateKey(): string {
    return this.configService.getOrThrow<string>(ACCESS_TOKEN_PRIVATE_KEY);
  }

  get refreshTokenPublicKey(): string {
    return this.configService.getOrThrow<string>(REFRESH_TOKEN_PUBLIC_KEY);
  }

  get refreshTokenPrivateKey(): string {
    return this.configService.getOrThrow<string>(REFRESH_TOKEN_PRIVATE_KEY);
  }

  get accessTokenTTL(): string {
    return this.configService.getOrThrow<string>(ACCESS_TOKEN_TTL);
  }

  get refreshTokenTTL(): string {
    return this.configService.getOrThrow<string>(REFRESH_TOKEN_TTL);
  }

  get refreshTokenCookieTTL(): number {
    return Number(this.configService.getOrThrow<string>(REFRESH_TOKEN_COOKIE_TTL));
  }
}
