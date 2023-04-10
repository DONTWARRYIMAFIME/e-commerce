import { Args, ID, Mutation, Resolver } from "@nestjs/graphql";
import { FileUpload, GraphQLUpload } from "graphql-upload";
import { Id } from "../../common/types/id.type";
import { SelectUserArgsType } from "./dto/select-user.input";
import { UserEntity } from "./entities/user.entity";
import { UserService } from "./user.service";

@Resolver(() => UserEntity)
export class UserResolver {
  constructor(private readonly userService: UserService) {}

  @Mutation(() => UserEntity)
  public restoreOneUser(@Args("input", { type: () => ID }) id: Id): Promise<UserEntity> {
    return this.userService.restoreOne(id);
  }

  @Mutation(() => UserEntity)
  public async updateAvatar(@Args() args: SelectUserArgsType, @Args("file", { type: () => GraphQLUpload }) file: FileUpload): Promise<UserEntity> {
    const { id } = args.input;
    return this.userService.uploadAvatar(id, file);
  }
}
