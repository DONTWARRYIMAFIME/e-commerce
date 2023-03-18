import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { EmailConstants } from "./email.constants";

@Injectable()
export class EmailConfigService {
  constructor(private configService: ConfigService) {}

  get host(): string {
    return this.configService.getOrThrow<string>(EmailConstants.SMTP_HOST);
  }

  get username(): string {
    return this.configService.getOrThrow<string>(EmailConstants.SMTP_USERNAME);
  }

  get password(): string {
    return this.configService.getOrThrow<string>(EmailConstants.SMTP_PASSWORD);
  }

  get port(): number {
    return Number(this.configService.getOrThrow<number>(EmailConstants.SMTP_PORT));
  }

  get secure(): boolean {
    return Boolean(this.configService.getOrThrow<number>(EmailConstants.SMTP_SECURE));
  }
}
