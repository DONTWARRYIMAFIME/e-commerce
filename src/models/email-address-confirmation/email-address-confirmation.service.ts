import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { EmailService } from "../../providers/email/email.service";
import { EmailAddressService } from "../email-address/email-address.service";
import { User } from "../user/entities/user.entity";
import { EmailAddressConfirmation } from "./entities/email-address-confirmation.entity";

@QueryService(EmailAddressConfirmation)
export class EmailAddressConfirmationService extends TypeOrmQueryService<EmailAddressConfirmation> {
  constructor(
    @InjectRepository(EmailAddressConfirmation) repo: Repository<EmailAddressConfirmation>,
    private readonly emailService: EmailService,
    private readonly emailAddressService: EmailAddressService,
  ) {
    super(repo);
  }

  public confirmEmailAddress(email: string): Promise<Id> {
    return this.emailAddressService.verifyEmail(email);
  }

  public async sendConfirmationEmail(user: User): Promise<EmailAddressConfirmation> {
    // await this.emailService.sendMail({
    //   to: user.email,
    // });

    return this.createOne({ user, email: user.email });
  }

  private generateToken(): string {
    return "token";
  }
}
