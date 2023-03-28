import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryGraphqlModuleOpts } from "@nestjs-query/query-graphql/dist/src/module";
import { DynamicModule, Module } from "@nestjs/common";
import { Actions, UseAbility } from "nest-casl";

@Module({})
export class CaslGraphQLModule extends NestjsQueryGraphQLModule {
  static forFeature(options: NestjsQueryGraphqlModuleOpts): DynamicModule {
    const resolvers = options?.resolvers?.map((resolver: any) => {
      return {
        ...resolver,
        read: {
          decorators: [UseAbility(Actions.read, resolver.DTOClass)],
          ...resolver.read,
        },
        create: {
          decorators: [UseAbility(Actions.create, resolver.DTOClass)],
          many: { disabled: true },
          ...resolver.create,
        },
        update: {
          decorators: [UseAbility(Actions.update, resolver.DTOClass)],
          many: { disabled: true },
          ...resolver.update,
        },
        delete: {
          decorators: [UseAbility(Actions.delete, resolver.DTOClass)],
          many: { disabled: true },
          ...resolver.delete,
        },
      };
    });

    return super.forFeature({
      ...options,
      imports: [...options.imports],
      resolvers,
    });
  }
}
