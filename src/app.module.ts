import { Module } from "@nestjs/common";
import { AppConfigModule } from "./config/app/app.module";
import { ModelsModule } from "./models/models.module";
import { DatabaseModule } from "./providers/database/database.module";
import { GraphQLModule } from "./providers/graphql/graphql.module";

@Module({
  imports: [AppConfigModule, DatabaseModule, GraphQLModule, ModelsModule],
  providers: [],
})
export class AppModule {}
