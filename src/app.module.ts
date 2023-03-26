import { Module } from "@nestjs/common";
import { AppConfigModule } from "./config/app/app.module";
import { ModelsModule } from "./models/models.module";
import { DatabaseModule } from "./providers/database/database.module";
import { EmailModule } from "./providers/email/email.module";
import { EventModule } from "./providers/event/event.module";
import { GraphQLModule } from "./providers/graphql/graphql.module";
import { I18nModule } from "./providers/i18n/i18n.module";
import { AuthenticationModule } from "./providers/security/authentication/authentication.module";

@Module({
  imports: [AppConfigModule, DatabaseModule, EventModule, GraphQLModule, I18nModule, EmailModule, ModelsModule, AuthenticationModule],
})
export class AppModule {}
