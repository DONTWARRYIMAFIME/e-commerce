import { Class } from "@nestjs-query/core";
import { Authorize as DefaultAuthorize, AuthorizerOptions, CustomAuthorizer } from "@nestjs-query/query-graphql";
import { find } from "lodash";
import { Actions } from "../../../providers/security/casl/actions.enum";
import { Context } from "../../types/context.type";

export function Authorize<DTO>(optsOrAuthorizerOrClass?: CustomAuthorizer<DTO> | Class<CustomAuthorizer<DTO>> | AuthorizerOptions<DTO>) {
  return function (target: any) {
    const originalDecorator = DefaultAuthorize(
      optsOrAuthorizerOrClass || {
        authorize: (context: Context) => {
          const permission = find(
            context.req.user.permissions,
            permission => permission.action === Actions.READ && permission.subject === target.name && permission.conditions !== null,
          );
          return permission ? JSON.parse(JSON.stringify(permission.conditions).replace("$", "")) : undefined;
        },
      },
    );
    return originalDecorator(target);
  };
}
