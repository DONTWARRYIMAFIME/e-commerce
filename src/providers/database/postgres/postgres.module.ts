import { Module } from "@nestjs/common";
import { TypeOrmModule, TypeOrmModuleAsyncOptions } from "@nestjs/typeorm";
import { DatabaseType } from "typeorm";
import { SnakeNamingStrategy } from "typeorm-naming-strategies";
import { PostgresConfigModule } from "../../../config/database/postgres/postgres.module";
import { PostgresConfigService } from "../../../config/database/postgres/postgres.service";

@Module({
  imports: [
    TypeOrmModule.forRootAsync({
      imports: [PostgresConfigModule],
      inject: [PostgresConfigService],
      useFactory: async (config: PostgresConfigService) => ({
        type: "postgres" as DatabaseType,
        host: config.host,
        port: config.port,
        username: config.username,
        password: config.password,
        database: config.database,
        entities: ["dist/**/*.entity.{ts,js}"],
        migrations: ["dist/migrations/*.migration.{ts,js}"],
        migrationsTableName: "migrations",
        migrationsRun: false,
        namingStrategy: new SnakeNamingStrategy(),
        logging: false,
        autoLoadEntities: true,
        synchronize: process.env.NODE_ENV !== "production",
      }),
    } as TypeOrmModuleAsyncOptions),
  ],
})
export class PostgresDatabaseModule {}
