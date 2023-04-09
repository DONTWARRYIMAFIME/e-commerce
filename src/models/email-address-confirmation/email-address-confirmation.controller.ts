import { Controller, Get, Query, Res } from "@nestjs/common";
import { Response } from "express";
import { AppConfigService } from "../../config/app/app.service";
import { IsPublic } from "../../providers/security/auth/decorators/is-public.decorator";
import { EmailAddressConfirmationService } from "./email-address-confirmation.service";

@Controller("confirm/email")
export class EmailAddressConfirmationController {
  constructor(private readonly config: AppConfigService, private readonly service: EmailAddressConfirmationService) {}

  @Get()
  @IsPublic()
  public async confirmEmailAddress(@Query("email") email: string, @Query("token") token: string, @Res() res: Response) {
    const result = await this.service.confirmEmailAddress(email, token);
    res.redirect(`${this.config.baseUrl}:${this.config.frontPort}`);
  }
}
