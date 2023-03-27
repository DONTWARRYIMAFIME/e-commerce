import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { EmailService } from "../../providers/email/email.service";
import { EmailAddressService } from "../email-address/email-address.service";
import { UserEntity } from "../user/entities/user.entity";
import { EmailAddressConfirmationEntity } from "./entities/email-address-confirmation.entity";

@QueryService(EmailAddressConfirmationEntity)
export class EmailAddressConfirmationService extends TypeOrmQueryService<EmailAddressConfirmationEntity> {
  constructor(
    @InjectRepository(EmailAddressConfirmationEntity) repo: Repository<EmailAddressConfirmationEntity>,
    private readonly emailService: EmailService,
    private readonly emailAddressService: EmailAddressService,
  ) {
    super(repo);
  }

  public confirmEmailAddress(email: string): Promise<Id> {
    return this.emailAddressService.verifyEmail(email);
  }

  public async sendConfirmationEmail(user: UserEntity): Promise<EmailAddressConfirmationEntity> {
    // await this.emailService.sendMail({
    //   to: user.email,
    // });

    return this.createOne({ user, emailAddress: user.emailAddress });
  }

  private generateToken(): string {
    return "token";
  }
}
