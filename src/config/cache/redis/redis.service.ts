import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { REDIS_HOST, REDIS_PASSWORD, REDIS_PORT, REDIS_TTL } from "./redis.constants";

@Injectable()
export class RedisConfigService {
  constructor(private configService: ConfigService) {}

  get host(): string {
    return this.configService.getOrThrow<string>(REDIS_HOST);
  }

  get password(): string {
    return this.configService.getOrThrow<string>(REDIS_PASSWORD);
  }

  get port(): number {
    return Number(this.configService.getOrThrow<string>(REDIS_PORT));
  }

  get ttl(): number {
    return Number(this.configService.getOrThrow<string>(REDIS_TTL));
  }
}
