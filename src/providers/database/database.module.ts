import { Module } from "@nestjs/common";
import { PostgresDatabaseModule } from "./postgres/postgres.module";

@Module({
  imports: [PostgresDatabaseModule],
  exports: [PostgresDatabaseModule],
})
export class DatabaseModule {}
