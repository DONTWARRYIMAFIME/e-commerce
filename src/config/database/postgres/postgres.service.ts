import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { PostgresConstants } from "./postgres.constants";

@Injectable()
export class PostgresConfigService {
  constructor(private configService: ConfigService) {}

  get host(): string {
    return this.configService.getOrThrow<string>(PostgresConstants.POSTGRES_HOST);
  }

  get database(): string {
    return this.configService.getOrThrow<string>(PostgresConstants.POSTGRES_DATABASE);
  }

  get username(): string {
    return this.configService.getOrThrow<string>(PostgresConstants.POSTGRES_USERNAME);
  }

  get password(): string {
    return this.configService.getOrThrow<string>(PostgresConstants.POSTGRES_PASSWORD);
  }

  get port(): number {
    return Number(this.configService.getOrThrow<number>(PostgresConstants.POSTGRES_PORT));
  }
}
