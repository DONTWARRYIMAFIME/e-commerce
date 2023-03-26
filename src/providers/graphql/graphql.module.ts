import { ApolloDriver, ApolloDriverConfig } from "@nestjs/apollo";
import { Module } from "@nestjs/common";
import { GraphQLModule as NestGraphQLModule } from "@nestjs/graphql";
import { ApolloServerPluginLandingPageLocalDefault } from "apollo-server-core";
import { join } from "path";
import { Context } from "../../common/types/context.type";

@Module({
  imports: [
    NestGraphQLModule.forRoot<ApolloDriverConfig>({
      cors: {
        origin: "https://studio.apollographql.com",
        credentials: true,
      },
      driver: ApolloDriver,
      autoSchemaFile: join(process.cwd(), "src", "schema.gql"),
      sortSchema: true,
      playground: false,
      plugins: [ApolloServerPluginLandingPageLocalDefault],
      context: (ctx: Context) => ctx,
    } as ApolloDriverConfig),
  ],
})
export class GraphQLModule {}
