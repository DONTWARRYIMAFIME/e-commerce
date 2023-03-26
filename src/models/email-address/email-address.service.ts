import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { EmailAddressEntity } from "./entities/email-address.entity";

@QueryService(EmailAddressEntity)
export class EmailAddressService extends TypeOrmQueryService<EmailAddressEntity> {
  constructor(@InjectRepository(EmailAddressEntity) repo: Repository<EmailAddressEntity>) {
    super(repo);
  }

  public findOneByEmail(address: string): Promise<EmailAddressEntity> {
    return this.repo.findOneBy({ address });
  }

  public async verifyEmail(email: string): Promise<Id> {
    const emailAddress = await this.findOneByEmail(email);
    await this.updateOne(emailAddress.id, { ...emailAddress, verified: true });
    return emailAddress.id;
  }
}
