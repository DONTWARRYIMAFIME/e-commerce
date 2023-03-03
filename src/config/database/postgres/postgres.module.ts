import { Module } from "@nestjs/common";
import { PostgresConfigService } from "./postgres.service";

@Module({
  providers: [PostgresConfigService],
  exports: [PostgresConfigService],
})
export class PostgresConfigModule {}
