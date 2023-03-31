import { ISendMailOptions } from "@nestjs-modules/mailer";
import { InjectQueue } from "@nestjs/bull";
import { Injectable } from "@nestjs/common";
import { Job, Queue } from "bull";
import { I18nContext } from "nestjs-i18n";
import { QueuePriority } from "../queues/queue-priority.enum";
import { EMAIL_QUEUE, SEND_EMAIL_JOB } from "../queues/queues.constants";

@Injectable()
export class EmailQueueService {
  constructor(@InjectQueue(EMAIL_QUEUE) private readonly emailQueue: Queue<ISendMailOptions>) {}

  public sendEmail(data: ISendMailOptions, priority = QueuePriority.MEDIUM): Promise<Job<ISendMailOptions>> {
    const { lang } = I18nContext.current();
    return this.emailQueue.add(SEND_EMAIL_JOB, { ...data, context: { ...data.context, i18nLang: lang } }, { priority });
  }
}
