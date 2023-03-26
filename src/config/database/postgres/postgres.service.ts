import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { POSTGRES_DATABASE, POSTGRES_HOST, POSTGRES_PASSWORD, POSTGRES_PORT, POSTGRES_USERNAME } from "./postgres.constants";

@Injectable()
export class PostgresConfigService {
  constructor(private configService: ConfigService) {}

  get host(): string {
    return this.configService.getOrThrow<string>(POSTGRES_HOST);
  }

  get database(): string {
    return this.configService.getOrThrow<string>(POSTGRES_DATABASE);
  }

  get username(): string {
    return this.configService.getOrThrow<string>(POSTGRES_USERNAME);
  }

  get password(): string {
    return this.configService.getOrThrow<string>(POSTGRES_PASSWORD);
  }

  get port(): number {
    return Number(this.configService.getOrThrow<string>(POSTGRES_PORT));
  }
}
