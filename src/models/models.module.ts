import { Module } from "@nestjs/common";
import { AddressModule } from "./address/address.module";
import { BrandModule } from "./brand/brand.module";
import { CartItemModule } from "./cart-item/cart-item.module";
import { CartModule } from "./cart/cart.module";
import { CategoryModule } from "./category/category.module";
import { CityModule } from "./city/city.module";
import { ColorModule } from "./color/color.module";
import { CommentModule } from "./comment/comment.module";
import { CountryModule } from "./country/country.module";
import { DeliveryMethodModule } from "./delivery-method/delivery-method.module";
import { EmailAddressConfirmationModule } from "./email-address-confirmation/email-address-confirmation.module";
import { EmailAddressModule } from "./email-address/email-address.module";
import { MediaModule } from "./media/media.module";
import { OrderItemModule } from "./order-item/order-item.module";
import { OrderModule } from "./order/order.module";
import { PaymentMethodModule } from "./payment-method/payment-method.module";
import { PermissionModule } from "./permission/permission.module";
import { PickupPointModule } from "./pickup-point/pickup-point.module";
import { PriceModule } from "./price/price.module";
import { ProductVariantModule } from "./product-variant/product-variant.module";
import { ProductModule } from "./product/product.module";
import { RoleModule } from "./role/role.module";
import { SizeModule } from "./size/size.module";
import { UserAddressModule } from "./user-address/user-address.module";
import { UserModule } from "./user/user.module";
import { WarehouseItemModule } from "./warehouse-item/warehouse-item.module";
import { WarehouseModule } from "./warehouse/warehouse.module";
import { WishlistModule } from "./wishlist/wishlist.module";

@Module({
  imports: [
    UserModule,
    EmailAddressModule,
    EmailAddressConfirmationModule,
    MediaModule,
    ProductModule,
    ProductVariantModule,
    ColorModule,
    PriceModule,
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
    OrderModule,
    OrderItemModule,
    PaymentMethodModule,
    RoleModule,
    PermissionModule,
    UserAddressModule,
    CommentModule,
  ],
})
export class ModelsModule {}
