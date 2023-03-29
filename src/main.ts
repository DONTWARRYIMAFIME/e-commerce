import { ValidationPipe } from "@nestjs/common";
import { NestFactory } from "@nestjs/core";
import * as cookieParser from "cookie-parser";
import { graphqlUploadExpress } from "graphql-upload";
import { i18nValidationErrorFactory, I18nValidationExceptionFilter } from "nestjs-i18n";
import { AppModule } from "./app.module";
import { AppConfigService } from "./config/app/app.service";

(async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const config: AppConfigService = app.get(AppConfigService);
  const port = config.port;
  const baseUrl = config.baseUrl;

  app.useGlobalFilters(new I18nValidationExceptionFilter());

  app.useGlobalPipes(new ValidationPipe({ exceptionFactory: i18nValidationErrorFactory }));
  app.useGlobalPipes(new ValidationPipe({ whitelist: true, transform: true }));

  app.use(cookieParser());

  // For file upload
  app.use(
    graphqlUploadExpress({
      maxFileSize: 10_000_000, // 10 MB
      maxFiles: 10,
    }),
  );

  await app.listen(port, () => {
    console.log("[WEB]", baseUrl + ":" + port);
  });
})();
