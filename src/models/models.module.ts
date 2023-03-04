import { Module } from "@nestjs/common";
import { LanguageModule } from "./language/language.module";
import { TranslationModule } from "./translation/translation.module";
import { UserModule } from "./user/user.module";

@Module({
  imports: [UserModule, LanguageModule, TranslationModule],
})
export class ModelsModule {}
