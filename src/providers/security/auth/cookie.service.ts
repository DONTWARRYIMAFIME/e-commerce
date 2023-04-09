import { Injectable } from "@nestjs/common";
import { Request, Response } from "express";
import { SecurityConfigService } from "../../../config/security/security.service";
import { COOKIE_REFRESH_TOKEN } from "./auth.constants";

@Injectable()
export class AuthenticationCookieService {
  constructor(private readonly config: SecurityConfigService) {}

  public sendRefreshToken(refreshToken: string, res: Response) {
    const cookieTTL: number = this.config.refreshTokenCookieTTL;

    res.cookie(COOKIE_REFRESH_TOKEN, refreshToken, {
      maxAge: cookieTTL,
      httpOnly: true,
      sameSite: "none",
      secure: true,
    });
  }

  public readRefreshToken(req: Request) {
    return req.cookies[COOKIE_REFRESH_TOKEN];
  }

  public clearCookies(res: Response) {
    res.clearCookie(COOKIE_REFRESH_TOKEN);
  }
}
