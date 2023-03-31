import { MailerModule } from "@nestjs-modules/mailer";
import { BullModule } from "@nestjs/bull";
import { Global, Module } from "@nestjs/common";
import { AppConfigModule } from "../../config/app/app.module";
import { EmailConfigModule } from "../../config/email/email.module";
import { EMAIL_QUEUE } from "../queues/queues.constants";
import { EmailQueueService } from "./email-queue.service";
import { EmailOptions } from "./email.options";
import { EmailProcessor } from "./email.processor";
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
    BullModule.registerQueue({ name: EMAIL_QUEUE }),
  ],
  providers: [EmailOptions, EmailService, EmailQueueService, EmailProcessor],
  exports: [EmailOptions, EmailQueueService],
})
export class EmailModule {}
