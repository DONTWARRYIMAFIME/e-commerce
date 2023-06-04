import { NestFactory } from "@nestjs/core";
import { useContainer } from "class-validator";
import * as cookieParser from "cookie-parser";
import { graphqlUploadExpress } from "graphql-upload";
import { I18nValidationExceptionFilter, I18nValidationPipe } from "nestjs-i18n";
import { AppModule } from "./app.module";
import { AppConfigService } from "./config/app/app.service";

(async function bootstrap() {
  const app = await NestFactory.create(AppModule, { rawBody: true });
  const config: AppConfigService = app.get(AppConfigService);
  const port = config.port;
  const baseUrl = config.baseUrl;

  app.useGlobalFilters(new I18nValidationExceptionFilter());
  app.useGlobalPipes(new I18nValidationPipe({ whitelist: true, transform: true }));

  app.use(cookieParser());

  // For file upload
  // only using graphql
  app.use((req: any, res: any, next: any) => {
    if (req.url.includes("/graphql")) {
      // only graphql request
      graphqlUploadExpress({
        maxFileSize: 10_000_000,
        maxFiles: 10,
      })(req, res, next);
    } else {
      next();
    }
  });

  // Enable DI for class-validator
  useContainer(app.select(AppModule), { fallbackOnErrors: true });

  await app.listen(port, () => {
    console.log("[WEB]", baseUrl + ":" + port);
  });
})();
