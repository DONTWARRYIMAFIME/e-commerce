import { ISendMailOptions, MailerService } from "@nestjs-modules/mailer";
import { Injectable } from "@nestjs/common";
import * as fs from "fs";
import * as Handlebars from "handlebars";
import * as juice from "juice";
import { I18nContext } from "nestjs-i18n";
import { SentMessageInfo } from "nodemailer";
import { basename, join } from "path";
import { scanDir } from "../../common/helpers/scan-dir.helper";
import { AppConfigService } from "../../config/app/app.service";
import { EmailOptions } from "./email.options";

export const SUBJECT = "subject";
export const HTML = "html";
export const EXTENSION = ".hbs";
export const DEFAULT_STYLE_FILE = "style.css";

export interface EmailMessage {
  subject: string;
  html: string;
}

export interface EmailContext {
  [name: string]: any;
}

@Injectable()
export class EmailService {
  constructor(private readonly mailerService: MailerService, private readonly emailOptions: EmailOptions, private readonly appConfigService: AppConfigService) {
    this.registerPartials(this.emailOptions.getPartialTemplateDir());
  }

  public async sendMail(sendMailOptions: ISendMailOptions): Promise<SentMessageInfo> {
    const { template, context, ...rest } = sendMailOptions;

    const email = await this.renderAll(template, this.prepareContext(context));

    await this.mailerService.sendMail({
      ...rest,
      ...email,
      context: this.prepareContext(context),
    });

    // TODO: emit an event 'email-sent'. Then catch it in EmailHistory and save subject and body
    // Or just inject EmailHistory service and save it manually
  }

  private async renderAll(template, context): Promise<EmailMessage> {
    const [subject, html] = await Promise.all([SUBJECT, HTML].map(type => this.render(type, template, context)));
    return { subject, html };
  }

  private async render(type, template, context): Promise<string> {
    const templatePath = join(this.emailOptions.getTemplateDir(), template, type + EXTENSION);
    const cssPath = join(this.emailOptions.getTemplateDir(), template, DEFAULT_STYLE_FILE);

    const templateContent = fs.readFileSync(templatePath, "utf8");

    const templateCompiled = Handlebars.compile(templateContent);
    const html = templateCompiled(context);

    const cssContent = fs.readFileSync(cssPath, "utf-8");
    return juice.inlineContent(html, cssContent);
  }

  private prepareContext(context: EmailContext): EmailContext {
    const { lang } = I18nContext.current();

    return {
      ...context,
      projectName: this.appConfigService.projectName,
      i18nLang: lang,
    };
  }

  private registerPartials(partialTemplateDir: string) {
    scanDir(partialTemplateDir, EXTENSION).forEach(partialTemplate => {
      const partial = Handlebars.compile(fs.readFileSync(join(partialTemplateDir, partialTemplate), "utf8"));
      Handlebars.registerPartial(basename(partialTemplate, EXTENSION), partial);
    });
  }
}
