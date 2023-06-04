import { InjectRepository } from "@nestjs/typeorm";
import { QueryService } from "@ptc-org/nestjs-query-core";
import { TypeOrmQueryService } from "@ptc-org/nestjs-query-typeorm";
import { FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { EmailAddressEntity } from "./entities/email-address.entity";

@QueryService(EmailAddressEntity)
export class EmailAddressService extends TypeOrmQueryService<EmailAddressEntity> {
  constructor(@InjectRepository(EmailAddressEntity) repo: Repository<EmailAddressEntity>) {
    super(repo);
  }

  public findOneByEmail(address: string, opts?: FindOptionsWhere<EmailAddressEntity>): Promise<EmailAddressEntity> {
    return this.repo.findOneBy({ ...opts, address });
  }

  public async verifyEmail(email: string): Promise<Id> {
    const emailAddress = await this.findOneByEmail(email);
    await this.updateOne(emailAddress.id, { verified: true });
    return emailAddress.id;
  }
}
