import { Module } from "@nestjs/common";
import { NestjsQueryGraphQLModule } from "@ptc-org/nestjs-query-graphql";
import { NestjsQueryTypeOrmModule } from "@ptc-org/nestjs-query-typeorm";
import { CreateWishlistInput } from "./dto/create-wishlist.input";
import { UpdateWishlistInput } from "./dto/update-wishlist.input";
import { WishlistEntity } from "./entities/wishlist.entity";
import { WishlistHook } from "./hooks/wishlist.hook";
import { UserCreatedListener } from "./listeners/user-create.listener";
import { WishlistResolver } from "./wishlist.resolver";
import { WishlistService } from "./wishlist.service";

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([WishlistEntity])],
      services: [WishlistService],
      resolvers: [
        {
          DTOClass: WishlistEntity,
          EntityClass: WishlistEntity,
          CreateDTOClass: CreateWishlistInput,
          UpdateDTOClass: UpdateWishlistInput,
          ServiceClass: WishlistService,
          read: { disabled: true },
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
      ],
    }),
  ],
  providers: [WishlistResolver, WishlistService, UserCreatedListener, WishlistHook],
  exports: [WishlistService],
})
export class WishlistModule {}
