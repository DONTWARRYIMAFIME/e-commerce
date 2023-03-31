import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { THROTTLER_LIMIT, THROTTLER_TTL } from "./throttler.constants";

@Injectable()
export class ThrottlerConfigService {
  constructor(private configService: ConfigService) {}

  get ttl(): number {
    return Number(this.configService.getOrThrow<string>(THROTTLER_TTL));
  }

  get limit(): number {
    return Number(this.configService.getOrThrow<string>(THROTTLER_LIMIT));
  }
}
