import { MailerModule } from "@nestjs-modules/mailer";
import { Global, Module } from "@nestjs/common";
import { AppConfigModule } from "../../config/app/app.module";
import { EmailConfigModule } from "../../config/email/email.module";
import { EmailOptions } from "./email.options";
import { EmailService } from "./email.service";

@Global()
@Module({
  imports: [
    AppConfigModule,
    EmailConfigModule,
    MailerModule.forRootAsync({
      imports: [EmailConfigModule],
      useClass: EmailOptions,
    }),
  ],
  providers: [EmailOptions, EmailService],
  exports: [EmailOptions, EmailService],
})
export class EmailModule {}
