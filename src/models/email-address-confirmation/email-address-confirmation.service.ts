import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { ApolloError } from "apollo-server-express";
import { Repository } from "typeorm";
import { v4 as uuidv4 } from "uuid";
import { Id } from "../../common/types/id.type";
import { AppConfigService } from "../../config/app/app.service";
import { EMAIL_ADDRESS_CONFIRMATION_EMAIL } from "../../providers/email/email.constants";
import { EmailService } from "../../providers/email/email.service";
import { EmailAddressService } from "../email-address/email-address.service";
import { UserEntity } from "../user/entities/user.entity";
import { EmailAddressConfirmationEntity } from "./entities/email-address-confirmation.entity";

@QueryService(EmailAddressConfirmationEntity)
export class EmailAddressConfirmationService extends TypeOrmQueryService<EmailAddressConfirmationEntity> {
  constructor(
    @InjectRepository(EmailAddressConfirmationEntity) repo: Repository<EmailAddressConfirmationEntity>,
    private readonly config: AppConfigService,
    private readonly emailService: EmailService,
    private readonly emailAddressService: EmailAddressService,
  ) {
    super(repo);
  }

  public findOneByToken(token: string): Promise<EmailAddressConfirmationEntity> {
    return this.repo.findOneBy({ token });
  }

  public findOneByUserId(userId: Id, emailAddressId: Id): Promise<EmailAddressConfirmationEntity> {
    return this.repo.findOneBy({ userId, emailAddressId });
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

  public async sendConfirmationEmail(user: UserEntity): Promise<EmailAddressConfirmationEntity> {
    const emailAddressConfirmation =
      (await this.findOneByUserId(user.id, user.emailAddress.id)) || (await super.createOne({ user, emailAddress: user.emailAddress, token: uuidv4() }));

    await this.emailService.sendMail({
      to: emailAddressConfirmation.emailAddress.address,
      template: EMAIL_ADDRESS_CONFIRMATION_EMAIL,
      context: {
        name: user.fullName,
        confirmationLink: `${this.config.baseUrl}:${this.config.port}/confirm/email?email=${emailAddressConfirmation.emailAddress.address}&token=${emailAddressConfirmation.token}`,
      },
    });

    return emailAddressConfirmation;
  }
}
