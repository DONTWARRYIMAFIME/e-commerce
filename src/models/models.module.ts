import { Module } from "@nestjs/common";
import { EmailAddressConfirmationModule } from "./email-address-confirmation/email-address-confirmation.module";
import { EmailAddressModule } from "./email-address/email-address.module";
import { LanguageModule } from "./language/language.module";
import { MediaModule } from "./media/media.module";
import { TranslationModule } from "./translation/translation.module";
import { UserModule } from "./user/user.module";

@Module({
  imports: [UserModule, LanguageModule, TranslationModule, EmailAddressModule, EmailAddressConfirmationModule, MediaModule],
})
export class ModelsModule {}
