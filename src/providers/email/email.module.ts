import { MailerModule } from "@nestjs-modules/mailer";
import { Module } from "@nestjs/common";
import { AppConfigModule } from "../../config/app/app.module";
import { EmailConfigModule } from "../../config/email/email.module";
import { EmailOptions } from "./email.options";
import { EmailService } from "./email.service";
import { UserCreatedListener } from "./listeners/user-created.listener";

@Module({
  imports: [
    AppConfigModule,
    EmailConfigModule,
    MailerModule.forRootAsync({
      imports: [EmailConfigModule],
      useClass: EmailOptions,
    }),
  ],
  providers: [EmailOptions, EmailService, UserCreatedListener],
  exports: [EmailOptions, EmailService],
})
export class EmailModule {}
