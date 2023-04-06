import { Module } from "@nestjs/common";
import { AddressModule } from "./address/address.module";
import { BrandModule } from "./brand/brand.module";
import { CartItemModule } from "./cart-item/cart-item.module";
import { CartModule } from "./cart/cart.module";
import { CategoryModule } from "./category/category.module";
import { CityModule } from "./city/city.module";
import { ColorModule } from "./color/color.module";
import { CountryModule } from "./country/country.module";
import { CurrencyModule } from "./currency/currency.module";
import { DeliveryMethodModule } from "./delivery-method/delivery-method.module";
import { EmailAddressConfirmationModule } from "./email-address-confirmation/email-address-confirmation.module";
import { EmailAddressModule } from "./email-address/email-address.module";
import { LanguageModule } from "./language/language.module";
import { MediaModule } from "./media/media.module";
import { PickupPointModule } from "./pickup-point/pickup-point.module";
import { PriceModule } from "./price/price.module";
import { ProductVariantModule } from "./product-variant/product-variant.module";
import { ProductModule } from "./product/product.module";
import { SizeModule } from "./size/size.module";
import { TranslationModule } from "./translation/translation.module";
import { UserModule } from "./user/user.module";
import { WarehouseItemModule } from "./warehouse-item/warehouse-item.module";
import { WarehouseModule } from "./warehouse/warehouse.module";
import { WishlistModule } from "./wishlist/wishlist.module";

@Module({
  imports: [
    UserModule,
    LanguageModule,
    TranslationModule,
    EmailAddressModule,
    EmailAddressConfirmationModule,
    MediaModule,
    ProductModule,
    ProductVariantModule,
    ColorModule,
    PriceModule,
    CurrencyModule,
    WarehouseModule,
    WarehouseItemModule,
    AddressModule,
    CityModule,
    CountryModule,
    WishlistModule,
    CartModule,
    CartItemModule,
    DeliveryMethodModule,
    PickupPointModule,
    SizeModule,
    CategoryModule,
    BrandModule,
  ],
})
export class ModelsModule {}
