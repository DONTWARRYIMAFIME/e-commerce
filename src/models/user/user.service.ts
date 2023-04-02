import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { join } from "path";
import { Readable } from "stream";
import { DeepPartial, FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { AddressService } from "../address/address.service";
import { AddressEntity } from "../address/entities/address.entity";
import { MediaService } from "../media/media.service";
import { UserEntity } from "./entities/user.entity";

@QueryService(UserEntity)
export class UserService extends TypeOrmQueryService<UserEntity> {
  constructor(@InjectRepository(UserEntity) repo: Repository<UserEntity>, private readonly mediaService: MediaService) {
    super(repo);
  }

  public findOneById(id: Id, opts?: FindOptionsWhere<UserEntity>): Promise<UserEntity> {
    return this.repo.findOne({ where: { id, ...opts } });
  }

  public findOneByEmail(email: string): Promise<UserEntity> {
    return this.repo.findOne({ relations: { emailAddress: true, roles: true }, where: { emailAddress: { address: email } } });
  }

  public async updateAvatar(user: UserEntity, stream: Readable, filename: string): Promise<UserEntity> {
    const media = await this.mediaService.saveMedia(stream, filename, join("users", user.id), user.avatar);
    return super.updateOne(user.id, { avatar: media });
  }

  public async addAddress(user: UserEntity, address: DeepPartial<AddressEntity>): Promise<UserEntity> {
    user.addresses.push(address as AddressEntity);
    return this.repo.save(user);
  }
}
