import { NestjsQueryGraphQLModule } from "@nestjs-query/query-graphql";
import { NestjsQueryGraphqlModuleOpts } from "@nestjs-query/query-graphql/dist/src/module";
import { DynamicModule, Module } from "@nestjs/common";
import { UseAbility } from "nest-casl";
import { Actions } from "./action.enum";

@Module({})
export class CaslGraphQLModule extends NestjsQueryGraphQLModule {
  static forFeature(options: NestjsQueryGraphqlModuleOpts): DynamicModule {
    const resolvers = options?.resolvers?.map((resolver: any) => {
      return {
        ...resolver,
        read: {
          decorators: [UseAbility(Actions.READ, resolver.DTOClass)],
          ...resolver.read,
        },
        create: {
          decorators: [UseAbility(Actions.CREATE, resolver.DTOClass)],
          many: { disabled: true },
          ...resolver.create,
        },
        update: {
          decorators: [UseAbility(Actions.UPDATE, resolver.DTOClass)],
          many: { disabled: true },
          ...resolver.update,
        },
        delete: {
          decorators: [UseAbility(Actions.DELETE, resolver.DTOClass)],
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
