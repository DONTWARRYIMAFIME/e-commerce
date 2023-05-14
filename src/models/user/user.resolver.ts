import { UseGuards } from "@nestjs/common";
import { Args, ID, Mutation, Resolver } from "@nestjs/graphql";
import { FileUpload, GraphQLUpload } from "graphql-upload";
import { Id } from "../../common/types/id.type";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { ResetPasswordArgsType } from "./dto/reset-password.input";
import { SelectUserArgsType } from "./dto/select-user.input";
import { UserEntity } from "./entities/user.entity";
import { UserHook } from "./hooks/user.hook";
import { UserService } from "./user.service";

@Resolver(() => UserEntity)
export class UserResolver {
  constructor(private readonly userService: UserService) {}

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, UserEntity, UserHook)
  @Mutation(() => UserEntity)
  public restoreOneUser(@Args("input", { type: () => ID }) id: Id): Promise<UserEntity> {
    return this.userService.restoreOne(id);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, UserEntity, UserHook)
  @Mutation(() => UserEntity)
  public async updateAvatar(@Args() args: SelectUserArgsType, @Args("file", { type: () => GraphQLUpload }) file: FileUpload): Promise<UserEntity> {
    const { id } = args.input;
    return this.userService.uploadAvatar(id, file);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, UserEntity, UserHook)
  @Mutation(() => UserEntity)
  public resetPassword(@Args() args: ResetPasswordArgsType): Promise<UserEntity> {
    const { id, update } = args.input;
    return this.userService.resetPassword(id as Id, update);
  }
}
