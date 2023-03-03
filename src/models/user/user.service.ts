import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { User } from "./entities/user.entity";

@QueryService(User)
export class UserService extends TypeOrmQueryService<User> {
  constructor(@InjectRepository(User) repo: Repository<User>) {
    super(repo);
  }

  public findOneByEmail(email: string): Promise<User> {
    return this.repo.findOneBy({ email });
  }

  public findOneByPhone(phone: string): Promise<User> {
    return this.repo.findOneBy({ phone });
  }
}
