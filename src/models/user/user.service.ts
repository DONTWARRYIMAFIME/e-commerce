import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { FileUpload } from "graphql-upload";
import { map } from "lodash";
import { join } from "path";
import { DeepPartial, FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { AddressService } from "../address/address.service";
import { USERS_FOLDER } from "../media/media.constants";
import { MediaService } from "../media/media.service";
import { UserEntity } from "./entities/user.entity";

@QueryService(UserEntity)
export class UserService extends TypeOrmQueryService<UserEntity> {
  constructor(@InjectRepository(UserEntity) repo: Repository<UserEntity>, private readonly mediaService: MediaService, private readonly addressService: AddressService) {
    super(repo);
  }

  public findOneById(id: Id, opts?: FindOptionsWhere<UserEntity>): Promise<UserEntity> {
    return this.repo.findOneBy({ id, ...opts });
  }

  public findOneByIdOrFail(id: Id, opts?: FindOptionsWhere<UserEntity>): Promise<UserEntity> {
    return this.repo.findOneByOrFail({ id, ...opts });
  }

  public findOneByEmail(email: string): Promise<UserEntity> {
    return this.repo.findOneBy({ emailAddress: { address: email } });
  }

  public async uploadAvatar(id: Id, file: FileUpload): Promise<UserEntity> {
    const user = await this.findOneByIdOrFail(id);
    const media = await this.mediaService.saveOneMedia({ id: user.avatarId, file, path: join(USERS_FOLDER, id) });
    return super.updateOne(id, { avatar: media });
  }

  public async addAddressesToUser(id: Id, update: DeepPartial<UserEntity>): Promise<UserEntity> {
    const addresses = await this.addressService.createMany(update.addresses);
    return super.addRelations("addresses", id, map(addresses, "id"));
  }

  public async removeAddressesFromUser(id: Id, update: DeepPartial<UserEntity>): Promise<UserEntity> {
    const ids = map(update.addresses, "id");
    await this.addressService.deleteMany({ id: { in: ids } });
    return this.findOneByIdOrFail(id);
  }
}
