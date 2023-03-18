import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { AppConstants } from "./app.constants";

@Injectable()
export class AppConfigService {
  constructor(private configService: ConfigService) {}

  get projectName(): string {
    return this.configService.getOrThrow<string>(AppConstants.PROJECT_NAME);
  }

  get baseUrl(): string {
    return this.configService.getOrThrow<string>(AppConstants.BASE_URL);
  }

  get port(): number {
    return Number(this.configService.getOrThrow<number>(AppConstants.PORT));
  }
}
