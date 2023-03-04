import { Module } from "@nestjs/common";
import { AppConfigModule } from "./config/app/app.module";
import { ModelsModule } from "./models/models.module";
import { DatabaseModule } from "./providers/database/database.module";
import { GraphQLModule } from "./providers/graphql/graphql.module";
import { I18nModule } from "./providers/i18n/i18n.module";

@Module({
  imports: [AppConfigModule, DatabaseModule, GraphQLModule, I18nModule, ModelsModule],
  providers: [],
})
export class AppModule {}
