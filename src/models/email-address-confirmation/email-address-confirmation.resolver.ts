import { UseGuards } from "@nestjs/common";
import { Mutation, Resolver } from "@nestjs/graphql";
import { AccessTokenAuthGuard } from "../../providers/security/auth/guards/access-token-auth.guard";
import { AccessGuard } from "../../providers/security/casl/access.guard";
import { Actions } from "../../providers/security/casl/actions.enum";
import { CaslUser } from "../../providers/security/casl/decorators/casl-user";
import { CheckAbility } from "../../providers/security/casl/decorators/check-ability";
import { UserProxy } from "../../providers/security/casl/proxies/user.proxy";
import { UserEntity } from "../user/entities/user.entity";
import { EmailAddressConfirmationService } from "./email-address-confirmation.service";
import { EmailAddressConfirmationEntity } from "./entities/email-address-confirmation.entity";

@Resolver(() => EmailAddressConfirmationEntity)
export class EmailAddressConfirmationResolver {
  constructor(private readonly confirmationService: EmailAddressConfirmationService) {}

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.UPDATE, EmailAddressConfirmationEntity)
  @Mutation(() => EmailAddressConfirmationEntity)
  public async confirmEmail(@CaslUser() userProxy: UserProxy<UserEntity>): Promise<EmailAddressConfirmationEntity> {
    const user = await userProxy.getFromHook();
    return this.confirmationService.sendConfirmationEmail(user);
  }

  @UseGuards(AccessTokenAuthGuard, AccessGuard)
  @CheckAbility(Actions.CREATE, EmailAddressConfirmationEntity)
  @Mutation(() => EmailAddressConfirmationEntity)
  public async sendConfirmationEmail(@CaslUser() userProxy: UserProxy<UserEntity>): Promise<EmailAddressConfirmationEntity> {
    const user = await userProxy.getFromHook();
    return this.confirmationService.sendConfirmationEmail(user);
  }
}
