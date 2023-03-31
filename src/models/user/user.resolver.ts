import { Args, Mutation, Resolver } from "@nestjs/graphql";
import { FileUpload, GraphQLUpload } from "graphql-upload";
import { CaslUser, UserProxy } from "nest-casl";
import { UserEntity } from "./entities/user.entity";
import { UserService } from "./user.service";

@Resolver(() => UserEntity)
export class UserResolver {
  constructor(private readonly userService: UserService) {}

  @Mutation(() => UserEntity)
  public async updateAvatar(@Args("file", { nullable: true, type: () => GraphQLUpload }) file: FileUpload, @CaslUser() userProxy: UserProxy<UserEntity>) {
    const user = await userProxy.getFromHook();
    return this.userService.updateAvatar(user, file.createReadStream(), file.filename);
  }
}
