import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { EmailAddress } from "./entities/email-address.entity";

@QueryService(EmailAddress)
export class EmailAddressService extends TypeOrmQueryService<EmailAddress> {
  constructor(@InjectRepository(EmailAddress) repo: Repository<EmailAddress>) {
    super(repo);
  }

  public findOneByEmail(email: string): Promise<EmailAddress> {
    return this.repo.findOneBy({ email });
  }

  public async verifyEmail(email: string): Promise<Id> {
    const emailAddress = await this.findOneByEmail(email);
    await this.updateOne(emailAddress.id, { ...emailAddress, verified: true });
    return emailAddress.id;
  }
}
