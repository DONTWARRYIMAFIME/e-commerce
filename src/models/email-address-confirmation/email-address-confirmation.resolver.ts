import { Query, Resolver } from "@nestjs/graphql";
import { CaslUser } from "../../providers/security/casl/decorators/casl-user";
import { UserProxy } from "../../providers/security/casl/proxies/user.proxy";
import { UserEntity } from "../user/entities/user.entity";
import { EmailAddressConfirmationService } from "./email-address-confirmation.service";
import { EmailAddressConfirmationEntity } from "./entities/email-address-confirmation.entity";

@Resolver(() => EmailAddressConfirmationEntity)
export class EmailAddressConfirmationResolver {
  constructor(private readonly confirmationService: EmailAddressConfirmationService) {}

  @Query(() => EmailAddressConfirmationEntity)
  public async sendConfirmationEmail(@CaslUser() userProxy: UserProxy<UserEntity>): Promise<EmailAddressConfirmationEntity> {
    const user = await userProxy.getFromHook();
    return this.confirmationService.sendConfirmationEmail(user);
  }
}
