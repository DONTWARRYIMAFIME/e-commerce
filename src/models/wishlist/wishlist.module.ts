import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { Module } from "@nestjs/common";
import { CreateWishlistInput } from "./dto/create-wishlist.input";
import { UpdateWishlistInput } from "./dto/update-wishlist.input";
import { WishlistEntity } from "./entities/wishlist.entity";
import { WishlistHook } from "./hooks/wishlist.hook";
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
  providers: [WishlistResolver, WishlistService, WishlistHook],
  exports: [WishlistService],
})
export class WishlistModule {}
