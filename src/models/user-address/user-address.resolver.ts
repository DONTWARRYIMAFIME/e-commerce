import { Resolver } from "@nestjs/graphql";
import { UserAddressEntity } from "./entities/user-address.entity";

@Resolver(() => UserAddressEntity)
export class UserAddressResolver {
  // constructor(private readonly userAddressService: UserAddressService) {}
  //
  // @Mutation(() => UserEntity)
  // public async addAddressToUser(@Args() args: AddAddressesToUserArgsType) {
  //   const { id, update } = args.input;
  //   return this.userAddressService.create(id as Id, update);
  // }
  //
  // @Mutation(() => UserEntity)
  // public async removeAddressFromUser(@Args() args: RemoveAddressesFromUserArgsType) {
  //   const { id, update } = args.input;
  //   return this.userAddressService.removeAddressesFromUser(id as Id, update);
  // }
}
