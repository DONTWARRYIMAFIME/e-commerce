import { MailerOptions, MailerOptionsFactory } from "@nestjs-modules/mailer";
import { HandlebarsAdapter } from "@nestjs-modules/mailer/dist/adapters/handlebars.adapter";
import { Injectable } from "@nestjs/common";
import { I18nService } from "nestjs-i18n";
import { Address, Options } from "nodemailer/lib/mailer";
import { join } from "path";
import { EmailConfigService } from "../../config/email/email.service";

@Injectable()
export class EmailOptions implements MailerOptionsFactory {
  constructor(private readonly config: EmailConfigService, private readonly i18n: I18nService) {}

  createMailerOptions(): MailerOptions {
    return {
      transport: {
        host: this.config.host,
        port: this.config.port,
        secure: false,
        auth: {
          user: this.config.username,
          pass: this.config.password,
        },
      },
      defaults: {
        from: {
          name: "e-commerce",
          address: "no-reply@e-commerce.com",
        },
      },
      template: {
        dir: join(__dirname, "templates"),
        adapter: new HandlebarsAdapter(
          {
            t: (key, args, options) => {
              if (!options) {
                options = args;
              }

              const lang = options.lookupProperty(options.data.root, "i18nLang");
              return this.i18n.t(key, { lang, args: options.data.root });
            },
          },
          {
            inlineCssEnabled: true,
          },
        ),
        options: {
          strict: true,
        },
      },
      options: {
        partials: {
          dir: join(__dirname, "partials"),
          options: {
            strict: true,
          },
        },
      },
      preview: process.env.NODE_ENV !== "production",
    };
  }

  getPathToTemplates(): string {
    return this.createMailerOptions().template.dir;
  }

  getPathToPartials(): string {
    return this.createMailerOptions().options.partials.dir;
  }

  getDefaultSenderEmailAddress(): string | Address {
    return (this.createMailerOptions().defaults as Options).from;
  }
}
