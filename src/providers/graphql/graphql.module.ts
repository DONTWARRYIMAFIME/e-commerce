import { KeyvAdapter } from "@apollo/utils.keyvadapter";
import { ApolloDriver, ApolloDriverConfig } from "@nestjs/apollo";
import { Module } from "@nestjs/common";
import { GraphQLModule as NestGraphQLModule } from "@nestjs/graphql";
import { ApolloServerPluginLandingPageLocalDefault } from "apollo-server-core";
import * as Keyv from "keyv";
import { join } from "path";
import { Context } from "../../common/types/context.type";
import { RedisConfigModule } from "../../config/cache/redis/redis.module";
import { RedisConfigService } from "../../config/cache/redis/redis.service";

@Module({
  imports: [
    NestGraphQLModule.forRootAsync<ApolloDriverConfig>({
      driver: ApolloDriver,
      imports: [RedisConfigModule],
      inject: [RedisConfigService],
      useFactory: async (configService: RedisConfigService) => ({
        cors: {
          origin: ["https://studio.apollographql.com", "http://localhost:3000"],
          credentials: true,
        },
        cache: new KeyvAdapter(
          new Keyv(`redis://${configService.user}:${configService.password}@${configService.host}:${configService.port}`, {
            ttl: configService.ttl,
            adapter: "redis",
          }),
        ),
        autoSchemaFile: join(process.cwd(), "src", "schema.gql"),
        sortSchema: true,
        playground: false,
        plugins: [ApolloServerPluginLandingPageLocalDefault],
        context: (ctx: Context) => ctx,
      }),
    } as ApolloDriverConfig),
  ],
})
export class GraphQLModule {}
