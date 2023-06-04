import { InjectRepository } from "@nestjs/typeorm";
import { QueryService } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { ApolloError } from "apollo-server-express";
import { Repository } from "typeorm";
import { v4 as uuidv4 } from "uuid";
import { AppConfigService } from "../../config/app/app.service";
import { EmailQueueService } from "../../providers/email/email-queue.service";
import { EMAIL_ADDRESS_CONFIRMATION_EMAIL } from "../../providers/email/email.constants";
import { EmailAddressService } from "../email-address/email-address.service";
import { UserEntity } from "../user/entities/user.entity";
import { EmailAddressConfirmationEntity } from "./entities/email-address-confirmation.entity";

@QueryService(EmailAddressConfirmationEntity)
export class EmailAddressConfirmationService extends TypeOrmQueryService<EmailAddressConfirmationEntity> {
  constructor(
    @InjectRepository(EmailAddressConfirmationEntity) repo: Repository<EmailAddressConfirmationEntity>,
    private readonly config: AppConfigService,
    private readonly emailService: EmailQueueService,
    private readonly emailAddressService: EmailAddressService,
  ) {
    super(repo);
  }

  public findOneByToken(token: string): Promise<EmailAddressConfirmationEntity> {
    return this.repo.findOneBy({ token });
  }

  public async findOneByEmailAddress(emailAddress: string): Promise<EmailAddressConfirmationEntity> {
    return this.repo.findOneBy({ emailAddress: { address: emailAddress } });
  }

  public async confirmEmailAddress(email: string, token: string): Promise<boolean> {
    const emailAddress = await this.emailAddressService.findOneByEmail(email);
    const emailAddressConfirmation = await this.findOneByToken(token);

    if (!emailAddress || !emailAddressConfirmation) {
      throw new ApolloError("Incorrect token");
    }

    if (emailAddress.verified) {
      throw new ApolloError("Email address already verified");
    }

    await this.emailAddressService.verifyEmail(email);
    await super.deleteOne(emailAddressConfirmation.id);
    return true;
  }

  public async sendConfirmationEmail(user: UserEntity, template = EMAIL_ADDRESS_CONFIRMATION_EMAIL): Promise<EmailAddressConfirmationEntity> {
    const emailAddressConfirmation =
      (await this.findOneByEmailAddress(user.emailAddress.address)) || (await super.createOne({ user, emailAddress: user.emailAddress, token: uuidv4() }));

    await this.emailService.sendEmail({
      to: emailAddressConfirmation.emailAddress.address,
      template,
      context: {
        name: user.fullName,
        confirmationLink: `${this.config.baseUrl}:${this.config.port}/confirm/email?email=${emailAddressConfirmation.emailAddress.address}&token=${emailAddressConfirmation.token}`,
      },
    });

    return emailAddressConfirmation;
  }
}
