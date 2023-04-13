import { Module } from "@nestjs/common";
import { AppConfigModule } from "./config/app/app.module";
import { ModelsModule } from "./models/models.module";
import { CacheModule } from "./providers/cache/cache.module";
import { DatabaseModule } from "./providers/database/database.module";
import { EmailModule } from "./providers/email/email.module";
import { EventModule } from "./providers/event/event.module";
import { GraphQLModule } from "./providers/graphql/graphql.module";
import { I18nModule } from "./providers/i18n/i18n.module";
import { StripeModule } from "./providers/payment/stripe/stripe.module";
import { BullModule } from "./providers/queues/bull/bull.module";
import { AuthModule } from "./providers/security/auth/auth.module";
import { ThrottlerModule } from "./providers/security/throttler/throttler.module";
import { ValidationModule } from "./providers/validation/validation.module";

@Module({
  imports: [
    AppConfigModule,
    DatabaseModule,
    GraphQLModule,
    EventModule,
    I18nModule,
    EmailModule,
    ValidationModule,
    ModelsModule,
    AuthModule,
    CacheModule,
    BullModule,
    ThrottlerModule,
    StripeModule,
  ],
})
export class AppModule {}
