import { Module } from "@nestjs/common";
import { AcceptLanguageResolver, CookieResolver, I18nModule as NestI18nModule } from "nestjs-i18n";
import { join } from "path";

@Module({
  imports: [
    NestI18nModule.forRoot({
      fallbackLanguage: "en",
      loaderOptions: {
        path: __dirname,
        watch: process.env.NODE_ENV !== "production",
      },
      resolvers: [new CookieResolver(["i18next"]), AcceptLanguageResolver],
      typesOutputPath: join(process.cwd(), "src", "providers", "i18n", "i18n.generated.ts"),
    }),
  ],
})
export class I18nModule {}
