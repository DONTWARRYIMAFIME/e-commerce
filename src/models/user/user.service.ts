import { QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { InjectRepository } from "@nestjs/typeorm";
import { FileUpload } from "graphql-upload";
import { join } from "path";
import { DeepPartial, FindOptionsWhere, Repository } from "typeorm";
import { Id } from "../../common/types/id.type";
import { USERS_FOLDER } from "../media/media.constants";
import { MediaService } from "../media/media.service";
import { UserEntity } from "./entities/user.entity";

@QueryService(UserEntity)
export class UserService extends TypeOrmQueryService<UserEntity> {
  constructor(@InjectRepository(UserEntity) repo: Repository<UserEntity>, private readonly mediaService: MediaService) {
    super(repo, { useSoftDelete: true });
  }

  public async findById(id: Id): Promise<UserEntity> {
    return id && this.repo.findOneBy({ id });
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

  public createOne(record: DeepPartial<UserEntity>): Promise<UserEntity> {
    return super.createOne(record);
  }

  public resetPassword(id: Id, record: Pick<UserEntity, "password">): Promise<UserEntity> {
    return super.updateOne(id, { password: record.password });
  }
}
