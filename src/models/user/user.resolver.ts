import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { FileUpload, GraphQLUpload } from "graphql-upload";
import { Id } from "../../common/types/id.type";
import { AddAddressesToUserArgsType, RemoveAddressesFromUserArgsType } from "./dto/relation-user.input";
import { SelectUserArgsType } from "./dto/select-user.input";
import { UserEntity } from "./entities/user.entity";
import { UserService } from "./user.service";

@Resolver(() => UserEntity)
export class UserResolver {
  constructor(private readonly userService: UserService) {}

  @Mutation(() => UserEntity)
  public async updateAvatar(@Args() args: SelectUserArgsType, @Args("file", { type: () => GraphQLUpload }) file: FileUpload): Promise<UserEntity> {
    const { id } = args.input;
    return this.userService.uploadAvatar(id, file);
  }

  @Mutation(() => UserEntity)
  public async addAddressToUser(@Args() args: AddAddressesToUserArgsType) {
    const { id, update } = args.input;
    return this.userService.addAddressesToUser(id as Id, update);
  }

  @Mutation(() => UserEntity)
  public async removeAddressFromUser(@Args() args: RemoveAddressesFromUserArgsType) {
    const { id, update } = args.input;
    return this.userService.removeAddressesFromUser(id as Id, update);
  }
}
