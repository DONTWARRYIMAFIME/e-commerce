import { ISendMailOptions, MailerService } from "@nestjs-modules/mailer";
import { Injectable, Logger } from "@nestjs/common";
import * as fs from "fs";
import * as Handlebars from "handlebars";
import * as juice from "juice";
import { I18nContext } from "nestjs-i18n";
import { SentMessageInfo } from "nodemailer";
import { join } from "path";
import { scanDirNames } from "../../common/helpers/scan-dir.helper";
import { AppConfigService } from "../../config/app/app.service";
import { EmailOptions } from "./email.options";

export const SUBJECT = "subject";
export const HTML = "html";
export const EXTENSION = ".hbs";
export const DEFAULT_STYLE_FILE = "style.css";
export type TemplateType = typeof SUBJECT | typeof HTML;

export interface EmailMessage {
  subject: string;
  html: string;
}

export interface EmailContext {
  [name: string]: any;
}

export interface Template {
  name: string;
  path: string;
  type: TemplateType;
}

@Injectable()
export class EmailService {
  private readonly logger = new Logger(EmailService.name);

  constructor(private readonly mailerService: MailerService, private readonly emailOptions: EmailOptions, private readonly appConfigService: AppConfigService) {
    this.registerPartials(this.emailOptions.getPathToPartials());
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

  private registerPartials(pathToPartials: string) {
    scanDirNames(pathToPartials).forEach(partialTemplate => {
      const partial = this.compile({
        name: partialTemplate,
        path: this.emailOptions.getPathToPartials(),
        type: HTML,
      });
      Handlebars.registerPartial(partialTemplate, partial);
    });
  }

  private compile(template: Template, extension: string = EXTENSION, style: string = DEFAULT_STYLE_FILE): HandlebarsTemplateDelegate {
    const templatePath = join(template.path, template.name, template.type + extension);
    const cssPath = join(template.path, template.name, style);

    const templateContent = fs.readFileSync(templatePath, "utf8");
    const styledTemplateContent = this.applyStyles(templateContent, cssPath);

    return Handlebars.compile(styledTemplateContent);
  }

  private applyStyles(templateContent: string, pathToStyles: string): string {
    if (!fs.existsSync(pathToStyles)) {
      this.logger.warn(`Unable to find styles on: ${pathToStyles}. TemplateContent didn't modified`);
      return templateContent;
    }

    const cssContent = fs.readFileSync(pathToStyles, "utf-8");
    return juice.inlineContent(templateContent, cssContent);
  }

  private render(template: Template, context: EmailContext, extension: string = EXTENSION, style: string = DEFAULT_STYLE_FILE): string {
    const templateCompiled = this.compile(template, extension, style);
    return templateCompiled(context);
  }

  private renderAll(templateName: string, context: EmailContext, extension: string = EXTENSION, style: string = DEFAULT_STYLE_FILE): EmailMessage {
    const [subject, html] = [SUBJECT, HTML].map((type: TemplateType) =>
      this.render({ name: templateName, path: this.emailOptions.getPathToTemplates(), type }, context, extension, style),
    );
    return { subject, html };
  }

  private prepareContext(context: EmailContext): EmailContext {
    const { lang } = I18nContext.current();

    return {
      ...context,
      projectName: this.appConfigService.projectName,
      supportEmail: this.emailOptions.getDefaultSenderEmailAddress(),
      i18nLang: lang,
    };
  }
}
