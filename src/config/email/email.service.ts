import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { SMTP_HOST, SMTP_PASSWORD, SMTP_PORT, SMTP_USERNAME } from "./email.constants";

@Injectable()
export class EmailConfigService {
  constructor(private configService: ConfigService) {}

  get host(): string {
    return this.configService.getOrThrow<string>(SMTP_HOST);
  }

  get username(): string {
    return this.configService.getOrThrow<string>(SMTP_USERNAME);
  }

  get password(): string {
    return this.configService.getOrThrow<string>(SMTP_PASSWORD);
  }

  get port(): number {
    return Number(this.configService.getOrThrow<number>(SMTP_PORT));
  }
}
