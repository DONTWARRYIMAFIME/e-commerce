import { ISendMailOptions } from "@nestjs-modules/mailer";
import { Process, Processor } from "@nestjs/bull";
import { Job } from "bull";
import { EMAIL_QUEUE, SEND_EMAIL_JOB } from "../queues/queues.constants";
import { EmailService } from "./email.service";

@Processor(EMAIL_QUEUE)
export class EmailProcessor {
  constructor(private readonly emailService: EmailService) {}

  @Process(SEND_EMAIL_JOB)
  public async handleSendEmailJob(job: Job<ISendMailOptions>): Promise<void> {
    await this.emailService.sendEmail(job.data);
  }
}
