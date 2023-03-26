import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { BASE_URL, PORT, PROJECT_NAME } from "./app.constants";

@Injectable()
export class AppConfigService {
  constructor(private configService: ConfigService) {}

  get projectName(): string {
    return this.configService.getOrThrow<string>(PROJECT_NAME);
  }

  get baseUrl(): string {
    return this.configService.getOrThrow<string>(BASE_URL);
  }

  get port(): number {
    return Number(this.configService.getOrThrow<string>(PORT));
  }
}
