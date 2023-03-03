import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { SecurityConstants } from "./security.constants";

@Injectable()
export class SecurityConfigService {
  constructor(private configService: ConfigService) {}

  get saltLength(): number {
    return Number(this.configService.getOrThrow<string>(SecurityConstants.SALT_LENGTH));
  }
}
