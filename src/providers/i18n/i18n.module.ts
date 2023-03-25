import { Module } from "@nestjs/common";
import { AcceptLanguageResolver, HeaderResolver, I18nModule as NestI18nModule } from "nestjs-i18n";
import { join } from "path";

@Module({
  imports: [
    NestI18nModule.forRoot({
      fallbackLanguage: "en",
      loaderOptions: {
        path: join(process.cwd(), "src", "i18n"),
        watch: process.env.NODE_ENV !== "production",
      },
      resolvers: [{ use: HeaderResolver, options: ["language", "lang", "l"] }, AcceptLanguageResolver],
      typesOutputPath: join(process.cwd(), "src", "i18n", "i18n.generated.ts"),
    }),
  ],
})
export class I18nModule {}
